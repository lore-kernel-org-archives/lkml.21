Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795432012;
	b=5qMEIGFEeBfIL7MNZ4yRssBVidkIOGFEOGO/5nUJSG1HXzE78VIEgnkJkas7zcnaYrKp
	 e/iAZqldKYlmQWvjNABCMfotrLYASmSgQiXYN3th5p03JVIEc0TQSq6Yrq5FvvMDqi4zB
	 A6oU/SsHfVybK1LKe68O7stiyXOCy92stdpo7sAvzTkB8CmuEQ+XtGX2S2+ATNHlrrZtr
	 sfCmgIEHjnGtDZ0K/LlBTchXnHTpkhziZg98PnGVnJUjVMHW+7aejcYbTjCaUQGHO//mF
	 Y1RMvO9I/MXoPQQTEmOJaRm1SYpb5D7ctV98eOnr9OaCDtzR92eY4FeSvGSXrGefZwQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795432012;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=x2Tbjo1AzwjlabGDk8wWzHIhO4lDKk/H2fZK+YLGVr0=;
	b=L1ogGhK+ES6DsEZZrxdiQ3uEiTvRyyUb2hklVUxct8g6/g1bgZFKiKnjrXhz1IDWbli7
	 znEeFr5/rV2Icm79LilDl7IXRtIXfQd4zDlQjzVzUC2YBS58bFdA08pgrrDjehDEsTHu/
	 /YZhq/IKFka5svqcJS9DNx4fIEyVxytP9mMdm+ae//Sv9ZuaWfhKrazq4r07+G+P4meMp
	 Rf63BxTwv5H1pLhlKCbB68RDxEl1or3jFpC63zk5DvdrZeqrY7LVhLqXfH9/MTvJPW7pm
	 61ya4nzUauMbZHyxn1ETheptYHONHd4WpsJgxeXYGQJV2EesscsRCu1MoDhKfAG0+SA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=h5rhgnZd;
	arc=none smtp.remote-ip=74.125.82.48
Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26141606A31F
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 11:06:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 26141606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=h5rhgnZd
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-168de2167deso33608c88.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 03:06:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795432010; x=1796036810; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=x2Tbjo1AzwjlabGDk8wWzHIhO4lDKk/H2fZK+YLGVr0=;
        b=h5rhgnZdeaDEquf4C5SUeMuOUl5z3ott5JiiDQzD1aJHXjVqX1W5fLAVsFRvVX0fgk
         q0s5pQHdxz+fnnjKYNMZdLxbZ9av5VT9cs3jznTRViv7lJNGG4+bQYm/fbgo2nu3H3rN
         Pt6Tbv/zGcFx8Tg5EcprFsrf+3YzG5NRF685EkiE0tofDpb6hwXu38HKlse3gjFOkHkZ
         g52rXZUJscJALtBuHlogyZ2mcQc9kunweZkfzl0TXLeReTnkhEPXtwLvlJP0AHGnrxZ8
         ck4wjtPunyrCjmYPSBJ5XELbpebteNrTEgg0AWCmLS8DEG3y8gyO/FGggAX6kLmXTXFi
         Tjdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795432010; x=1796036810;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x2Tbjo1AzwjlabGDk8wWzHIhO4lDKk/H2fZK+YLGVr0=;
        b=K1IECcbMNkAeEQz0LbTeU7cVlAPN1S8r5LyxO/8Mk6vtNzGLyzCGBMTpF7xCAKQHOv
         phdUREWQ82w68WHhFMkKJFLznWC9rkVk2opzQGVJ1O6RViV7RWL0tbR45bKq7LU3Bqie
         y6T0zvvb/5/L5xExooBFiREaJxQNvBPnXDbX/AnfvieGqcgxtROdnagr+LtEsSRidyfx
         ARP31cGGEAfjsQ1tR31bkLaUuepiVG0H34817GYIAMWH1qOHBVr1x10urbILKCgjL2YO
         gpG/bpCCfal0ScyLIjuc5zabx3yZnnlocmzB3C3zgc69WUg5dnBjna8w6Duyx+g1oBkc
         W4zA==
X-Forwarded-Encrypted: i=1; AL+hErGPC9MR7LNMJ1cbS8B2RFg2hP0fiiw7MNy7uUmHO3hJ2j1qTJQmOP9k4fVjfZt0sSsnL7wqtimCH900mLg=@vger.kernel.org
X-Gm-Message-State: APuU4Z+b118SgJ/fkU3ZDkYPyrnpGKoOzMGab6InUTL74DKTVg/k49AJ
	f/pO03zcDOAeoDQPYHazk94rXCG2zGWeui+CaOgn9LAUwSDT7JllOD6o
X-Gm-Gg: AZFdTZdLPMfh6ws8tmENSDjnmKo0Hom3KRCIwIuuh5njFnUhdDAR+4ykJoJkjjX3f4S
	Lhkmhz1xDe0qLkizQh3TTIGV6AjuDqHy40WYi9ImYFjhKVuWy/1K9WieH8c3dq6XKwOnx9TtuaU
	zfwwnFbgEyVD23tqoeWNn94l946A4RXUwiVN5LQBG4oKvnV1yjnaMB1ky4eQp4i7qLtihUF7kBa
	LV6SfW4RSCfPs+ZyNzOsxWEc+bZwN91ClDue9rrs0bsfYaSM1TK6J8nuVA+3EkufF1RZnQ7t8Ty
	WMI7iAIYgOgVJxOeqQwaodd9nlDA6MpAnWl/Q58c9UACq2F40CQStPMS0t/TKeanRp+zdb6IJva
	BQzNz3ZZSXWDIDW9dJI0N3872hAp/BnvpcTfIIJF9Mei/de9PEN9lwowUm3J3qMNVHa4tPoF7QW
	LIVENUnW2thSSUm7s3kCp8KAB4wtzFuwzOf+3oauXgRK36DH6wOZ5QYQr1t6SnrOs8icOTgkRa6
	iDJ3F3SfK0zWs7ennPbprHtDylP2J6iBorgL0Iidu3q2oXo9DqDdiZSiRUitToNUfjOohe0w0EK
	CYynBSLrOoasNLZtOx6VMKbGrBCLDbrq9xP10RtOa8QTpLnTNZ2dQAgq5Exu1eKuv3w7OipeZvF
	Jfqhgaz8BYyTJpzhjMILw5VXO
X-Received: by 2002:a05:7022:b90d:b0:127:def:dd72 with SMTP id a92af1059eb24-1b55687f1a1mr15744484c88.2.1795432009821;
        Mon, 23 Nov 2026 03:06:49 -0800 (PST)
Received: from chenyou.ncku.edu.tw ([140.116.19.16])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5567ff27bsm30054074c88.6.2026.11.23.03.06.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 03:06:49 -0800 (PST)
From: Chen-Yu Yeh <chenyou910331@gmail.com>
To: alexs@kernel.org,
	corbet@lwn.net
Cc: wy@wyuan.org,
	dzm91@hust.edu.cn,
	si.yanteng@linux.dev,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chen-Yu Yeh <chenyou910331@gmail.com>
Subject: [PATCH v2 01/13] docs/zh_TW: process: add researcher-guidelines.rst translation
Date: Mon, 23 Nov 2026 19:06:24 +0800
Message-ID: <20261123110637.172045-2-chenyou910331@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261123110637.172045-1-chenyou910331@gmail.com>
References: <20261123110637.172045-1-chenyou910331@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Translate Documentation/process/researcher-guidelines.rst into
Traditional Chinese from the current English text, including the
"Surveys" section from commit ad93f083bdb7 ("docs: Add a section on
surveys to the researcher guidelines") and the tech-board list address
from commit 27103dddc2da ("Documentation: update mailing list
addresses").  The zh_CN translation was consulted for wording only.

Keep the three reference link titles and the example commit log in
English, as in the original.

List the new file in the toctree of process/index.rst, after
management-style as in the English index, and drop it from the
TODOList.

update to commit 27103dddc2da ("Documentation: update mailing list
addresses")

Signed-off-by: Chen-Yu Yeh <chenyou910331@gmail.com>
Reviewed-by: Weijie Yuan <wy@wyuan.org>
---
 .../translations/zh_TW/process/index.rst      |   2 +-
 .../zh_TW/process/researcher-guidelines.rst   | 134 ++++++++++++++++++
 2 files changed, 135 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/translations/zh_TW/process/researcher-guidelines.rst

diff --git a/Documentation/translations/zh_TW/process/index.rst b/Documentation/translations/zh_TW/process/index.rst
index bd638264bbe4..fd53103aeb33 100644
--- a/Documentation/translations/zh_TW/process/index.rst
+++ b/Documentation/translations/zh_TW/process/index.rst
@@ -70,11 +70,11 @@ TODOList:
    stable-api-nonsense
    stable-kernel-rules
    management-style
+   researcher-guidelines
 
 TODOList:
 
 * contribution-maturity-model
-* researcher-guidelines
 * generated-content
 * coding-assistants
 * conclave
diff --git a/Documentation/translations/zh_TW/process/researcher-guidelines.rst b/Documentation/translations/zh_TW/process/researcher-guidelines.rst
new file mode 100644
index 000000000000..f1b71e4f5899
--- /dev/null
+++ b/Documentation/translations/zh_TW/process/researcher-guidelines.rst
@@ -0,0 +1,134 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+.. include:: ../disclaimer-zh_TW.rst
+
+:Original: Documentation/process/researcher-guidelines.rst
+
+研究人員指南
+++++++++++++
+
+Linux 核心社群歡迎對 Linux 核心、產生核心所涉及的活動，以及其開發過程中的
+任何其他副產品進行透明的研究。Linux 從這類研究中獲益良多，而 Linux 的大多
+數面向也都以某種形式受到研究的推動。
+
+社群非常感謝研究人員在公開研究結果之前先分享初步發現，特別是涉及安全性的
+研究。及早參與既有助於提升研究的品質，也有助於 Linux 從研究中獲得改進。無
+論如何，都建議與社群分享已發表研究的開放取用（open access）版本。
+
+本文件旨在說明 Linux 核心社群在進行這類研究時，認為哪些做法可以接受、哪些
+不可接受。這類研究及相關活動至少應遵循標準的研究倫理規範。關於一般的研究
+倫理、科技倫理，特別是針對開發者社群之研究的更多背景資訊，請參閱：
+
+* `History of Research Ethics <https://www.unlv.edu/research/ORI-HSR/history-ethics>`_
+* `IEEE Ethics <https://www.ieee.org/about/ethics/index.html>`_
+* `Developer and Researcher Views on the Ethics of Experiments on Open-Source Projects <https://arxiv.org/pdf/2112.13217.pdf>`_
+
+Linux 核心社群期望每一位與本專案互動的人，都是本著善意參與，為了讓 Linux
+變得更好。歡迎對 Linux 核心社群產出的任何公開成果（包括但不限於原始程式碼）
+進行研究，但以開發者為對象的研究必須明確採取選擇加入（opt-in）的方式。
+
+完全基於公開來源（包括公開郵件列表上的貼文，以及公開儲存庫中的提交）的被
+動研究，顯然是允許的。不過，如同任何研究一樣，仍然必須遵循標準的倫理規範。
+
+然而，針對開發者行為的主動研究，必須在取得相關開發者個人的明確同意，並向
+他們完整揭露的情況下進行。未經同意，不得與開發者互動或對他們進行實驗；這
+同樣是標準的研究倫理。
+
+問卷調查
+========
+
+研究經常採取向維護者或貢獻者發送問卷調查的形式。不過，一般而言，核心社群
+從這些問卷調查中獲得的價值很少。核心開發流程之所以能夠運作，是因為每位開
+發者都能從自己的參與中受益，即使是與目標不同的其他人一起工作也是如此。然
+而，回覆問卷調查是加諸在忙碌開發者身上的單向要求，對他們自己或整個核心社
+群都沒有相對應的好處。因此，我們不鼓勵這種研究方法。
+
+核心社群成員收到的電子郵件已經太多了，很可能會把問卷調查的請求視為又一項
+占用他們時間的要求。發送這類請求會剝奪社群寶貴的貢獻者時間，而且不太可能
+得到具有統計意義的回應。
+
+作為替代方案，研究人員應該考慮參加開發者活動，舉辦說明研究專案及其對參與
+者之好處的場次，並在那裡直接與社群互動。這樣獲得的資訊會比電子郵件問卷調
+查豐富得多，而社群也能從你的見解中學習並因此受益。
+
+補丁
+====
+
+說明一下：向開發者發送補丁 *確實是* 與他們互動，但他們已經同意接收
+*善意的貢獻*。他們並未同意接收刻意帶有缺陷或漏洞的補丁，也未同意在討論中
+被提供誤導性的資訊。這類交流可能對開發者造成傷害（例如耗費時間、精力和士
+氣），也會損害專案：它會侵蝕整個開發者社群對該貢獻者（以及該貢獻者所屬組
+織整體）的信任，破壞為貢獻者提供建設性回饋的努力，並使終端使用者暴露於軟
+體缺陷的風險之中。
+
+研究人員參與 Linux 本身的開發，與其他任何人一樣，都是受到歡迎與鼓勵的。研
+究 Linux 程式碼是常見的做法，尤其是在開發或執行能產生具體可行結果的分析工
+具時。
+
+在與開發者社群互動時，發送補丁向來是發揮影響力的最佳方式。Linux 已知的缺
+陷已經夠多了——更有幫助的是經過審查的修復。在貢獻之前，請仔細閱讀相關文件：
+
+* Documentation/process/development-process.rst
+* Documentation/process/submitting-patches.rst
+* Documentation/admin-guide/reporting-issues.rst
+* Documentation/process/security-bugs.rst
+
+然後發送補丁（包括附有下列所有細節的提交日誌），並跟進其他開發者的任何回饋。
+
+發送由研究產生的補丁時，提交日誌至少應包含以下細節，讓開發者有適當的背景
+來理解這項貢獻。請回答：
+
+* 發現的具體問題是什麼？
+* 在執行中的系統上，如何觸發這個問題？
+* 遇到這個問題會對系統造成什麼影響？
+* 問題是如何發現的？請具體說明所使用的任何測試、靜態或動態分析程式，以及
+  用於完成這項工作的任何其他工具或方法的細節。
+* 問題是在哪個 Linux 版本上發現的？強烈建議使用最新的發布版本或近期的
+  linux-next 分支（請參閱 Documentation/process/howto.rst）。
+* 為了修復問題做了哪些修改？為什麼認為這些修改是正確的？
+* 這項修改是如何進行建置測試和執行期測試的？
+* 這項修改修復的是之前的哪一個提交？如文件所述，這應該寫在 "Fixes:" 標籤中。
+* 還有誰審查過這個補丁？這應該寫在適當的 "Reviewed-by:" 標籤中；請見下文。
+
+例如::
+
+  From: Author <author@email>
+  Subject: [PATCH] drivers/foo_bar: Add missing kfree()
+
+  The error path in foo_bar driver does not correctly free the allocated
+  struct foo_bar_info. This can happen if the attached foo_bar device
+  rejects the initialization packets sent during foo_bar_probe(). This
+  would result in a 64 byte slab memory leak once per device attach,
+  wasting memory resources over time.
+
+  This flaw was found using an experimental static analysis tool we are
+  developing, LeakMagic[1], which reported the following warning when
+  analyzing the v5.15 kernel release:
+
+   path/to/foo_bar.c:187: missing kfree() call?
+
+  Add the missing kfree() to the error path. No other references to
+  this memory exist outside the probe function, so this is the only
+  place it can be freed.
+
+  x86_64 and arm64 defconfig builds with CONFIG_FOO_BAR=y using GCC
+  11.2 show no new warnings, and LeakMagic no longer warns about this
+  code path. As we don't have a FooBar device to test with, no runtime
+  testing was able to be performed.
+
+  [1] https://url/to/leakmagic/details
+
+  Reported-by: Researcher <researcher@email>
+  Fixes: aaaabbbbccccdddd ("Introduce support for FooBar")
+  Signed-off-by: Author <author@email>
+  Reviewed-by: Reviewer <reviewer@email>
+
+如果你是第一次貢獻，建議在把補丁發布到公開列表之前，先私下請其他人審查補
+丁本身。（如果有人明確告訴過你，你的補丁需要更仔細的內部審查，這就是必要
+的。）最終的補丁中應包含這些人的 "Reviewed-by" 標籤。找一位熟悉 Linux 貢獻
+流程的開發者，尤其是你所屬組織內部的人，請他們在補丁發送到公開郵件列表之
+前協助審查，往往能顯著提升最終補丁的品質，從而減輕其他開發者的負擔。
+
+如果找不到人在內部審查補丁，而你需要協助尋找這樣的人，或者你對本文件以及
+開發者社群的期望有任何其他問題，請聯絡技術諮詢委員會（Technical Advisory
+Board）的私人郵件列表：<tech-board@groups.linuxfoundation.org>。
-- 
2.43.0

