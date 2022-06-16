#ifndef Rosella_ASTNodeList
#define Rosella_ASTNodeList 1

#include "AST/Base/ASTNodeBase.h"
#include <vector>

namespace Rosella
{
    class ASTNodeList: ASTNodeBase
    {
        public:

        void AddToList(ASTNodeBase* element);

        template<class ASTClass>
        ASTClass* GetNodeAt(UInt64 index);

        template<class ASTClass>
        static ASTClass* CreateOrAddToList(ASTNodeBase* parent, ASTNodeBase* addTo);

        protected:
        std::vector<ASTNodeBase*> nodeList;
    };

    template<class ASTClass>
    ASTClass* ASTNodeList::GetNodeAt(UInt64 index)
    {
        Assert(index < nodeList.size());
        return dynamic_cast<ASTClass*>(nodeList.at(index));
    }

    template<class ASTClass>
    ASTClass* ASTNodeList::CreateOrAddToList(ASTNodeBase* parent, ASTNodeBase* addTo)
    {
        if(parent->IsA<ASTClass>())
        {
            ASTClass* listInstance = parent->As<ASTClass>();
            listInstance->AddToList(addTo);
            return listInstance;
        }
        else
        {
            ASTClass* listInstance = ASTClass();
            if(listInstance->template IsA<ASTNodeList>())
            {
                listInstance->AddToList(addTo);
                return listInstance;
            }
            else
            {
                AssertError(false, "%s", "Specified class does not inherit from ASTNodeList!");
            }

        }

        return nullptr;
    }
}

#endif