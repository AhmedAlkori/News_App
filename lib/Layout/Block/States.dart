abstract class NewsState {}

class NewsInitState extends NewsState{}

class NewsChangeBottomNavIndexState extends NewsState{}

class NewsChangeModeState extends NewsState{}

class NewsGetBusinessLoadingState extends NewsState{}
class NewsGetBusinessSuccessState extends NewsState{}
class NewsGetBusinessErrorState extends NewsState{}

class NewsGetSportsLoadingState extends NewsState{}
class NewsGetSportsSuccessState extends NewsState{}
class NewsGetSportsErrorState extends NewsState{}


class NewsGetScienceLoadingState extends NewsState{}
class NewsGetScienceSuccessState extends NewsState{}
class NewsGetScienceErrorState extends NewsState{}

class NewsSearchLoadingState extends NewsState{}
class NewsSearchSuccessState extends NewsState{}
class NewsSearchErrorState extends NewsState{}