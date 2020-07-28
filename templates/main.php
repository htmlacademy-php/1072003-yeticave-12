<main class="container">
    <section class="promo">
        <h2 class="promo__title">Нужен стафф для катки?</h2>
        <p class="promo__text">На нашем интернет-аукционе ты найдёшь самое эксклюзивное сноубордическое и горнолыжное снаряжение.</p>
        <ul class="promo__list">
            <?php foreach ($categories as $value): ?>

            <!--заполните этот список из массива категорий-->
                <li class="promo__item promo__item--boards">
                    <a class="promo__link" href="pages/all-lots.html"><?=esc($value)?></a>
                </li>

            <?php endforeach; ?>
        </ul>
    </section>
    <section class="lots">
        <div class="lots__header">
            <h2>Открытые лоты</h2>
        </div>
        <ul class="lots__list">
            <?php foreach ($lots as $val): ?>

            <!--заполните этот список из массива с товарами-->
                <li class="lots__item lot">
                    <div class="lot__image">
                        <img src="<?=esc($val['url'])?>" width="350" height="260" alt="<?=esc($val['name'])?>">
                    </div>
                    <div class="lot__info">
                        <span class="lot__category"><?=esc($val['category'])?></span>
                        <h3 class="lot__title"><a class="text-link" href="pages/lot.html"><?=esc($val['name'])?></a></h3>
                        <div class="lot__state">
                            <div class="lot__rate">
                                <span class="lot__amount">Стартовая цена</span>
                                <span class="lot__cost"><?=format_cost(esc($val['cost']))?></span>
                            </div>
                            <?php
                                    [$hours, $minutes] = get_dt_range($val['expiry_date']);
                            ?>
                            <div class="lot__timer timer  <?= (int) $hours === 0 ? 'timer--finishing' : ''; ?>">
                                <?="{$hours} : {$minutes}"; ?>
                            </div>
                        </div>
                    </div>
                </li>
            <?php endforeach; ?>
        </ul>
    </section>
</main>
</div>
