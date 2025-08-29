# 📋 Planejador de Tarefas

Um simples **aplicativo de planejamento** feito em Flutter.  
Ele permite adicionar tarefas, marcar como concluídas, acompanhar o progresso e visualizar todas as tarefas concluídas.

---

## ✨ Funcionalidades

- ➕ **Adicionar tarefas** facilmente.
- ✅ **Marcar e desmarcar tarefas** como concluídas.
- 📊 **Barra de progresso** mostrando a porcentagem concluída.
- 👀 **Visualizar todas as tarefas concluídas** em uma lista.
- 🗑️ Mensagem amigável quando não existem tarefas.

---

## 🖼️ Preview

📱 Tela principal com barra de progresso, campo para adicionar tarefas e lista de itens.

- Campo de texto para digitar a nova tarefa.  
- Botão **Adicionar** insere a tarefa na lista.  
- Checkbox para marcar a tarefa como concluída.  
- Barra de progresso atualiza automaticamente.  
- Botão flutuante exibe as tarefas concluídas em um **popup**.

---

## 🛠️ Estrutura do Código

- **`Task`** → Classe que representa uma tarefa (nome + status concluído).  
- **`MyHomePage`** → Tela principal, onde ficam a barra de progresso, input e lista de tarefas.  
- **`Progress`** → Componente que exibe a barra de progresso e percentual concluído.  
- **`TaskList`** → Renderiza a lista de tarefas ou mostra mensagem de vazio.  
- **`TaskItem`** → Widget individual da tarefa, com checkbox e título.  

---

## 🚀 Como Executar

1. Certifique-se de ter o **Flutter** instalado ([guia oficial](https://docs.flutter.dev/get-started/install)).
2. Clone este repositório:

   ```
   git clone https://github.com/Loorea/ToDoList.git
   cd ToDoList

3. Rode o app:
   ```
   flutter run
  
## 📂 Estrutura do Projeto
```
ToDoList/
├── android/                 # Configurações e código nativo Android
├── ios/                     # Configurações e código nativo iOS
├── lib/                     # Código principal do app em Flutter (Dart)
│   └── main.dart            # Arquivo inicial com toda a lógica da aplicação
├── web/                     # Arquivos para execução no navegador (Flutter Web)
├── .metadata                # Metadados do projeto Flutter
├── README.md                # Documentação do projeto
├── analysis_options.yaml    # Configuração de lint/análise estática
├── pubspec.yaml             # Dependências, nome do app e configurações
```

