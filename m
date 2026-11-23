Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795431774;
	b=eAxZeN39w7uiXU+iEfGah73+ykidPeG1wu70SpVM3QEviQz9aM3BTziaDB4w8BK1REkM
	 G1PXUfIG7CXbK0G/RU2P72fn5DxRA/m9bzH1wGBm6NOLJQT/EKstuI1WJGNFodN0Vzz4A
	 3fhdkitFzohAKr8OvrhoWoYT/gDWTboq8BevV/b2Rw4y0WJWX6JAQAJgFsg9531HwttzQ
	 KfE9oYRGsPew+uSiEleTol5E/7NRrPqEJj04axoICt6Ka3GDUp+xapWmKIrseQ3BQUVPQ
	 5XicyhG/vtpGU45g4eMX45BhfmNB5VlatdOC9DEUj5hOzSN6sbpeNLSUMAFTiQcvDtg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795431774;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=wqx+iIyAhe2d4XXXu3h+vmHZKd4T7+bh2chBWG5DneU=;
	b=1tDORsG5CRCMc1Hf6fKeEL8pqXV3gooaTqyNKzefLnYDVTmLBA8jlJGoL4wxYwXYNUI4
	 NS7HUtxuR/33+2r+4/93iH97un8avR6crab+ItRBSBxf37RCVdqdGCtd78hrsxh8iUKZB
	 JGZj5NhRzFO22jrUwBI2FVJnSqL+z/9d7mHGR5FBkbhQGLP/cpjgXGMejjQG98rqG/1EB
	 iazkyuizX/KFhgqTD5ychphjt0JWmfurQob9ef561A/e49pwrImawGrtR0ZCUCULwUn8h
	 qI/lDQRlrTGsAPl7BfPEjSiHq80tGPt40HURplDxPhZLjP4s1DkMjTRjSrXN498rcYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WsgoPZMZ;
	arc=none smtp.remote-ip=209.85.214.170
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EAFF606A683
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 11:02:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6EAFF606A683
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WsgoPZMZ
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2ee1d54f281so3010895ad.2
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 03:02:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795431774; x=1796036574; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wqx+iIyAhe2d4XXXu3h+vmHZKd4T7+bh2chBWG5DneU=;
        b=WsgoPZMZ7GOqV8mdwmZpVhtampj4ArEE/UDx3w6UCtHjrCsQMcEaL4MOxhXub+DTft
         qehk6BGifARtbMyp7x8hBMWWzYfBhrzM4kJqAkBTyCFJ6F5xwjqrEv3kgycWTrmwUGIT
         caO0M6BdvNlx33Ucn7LR9/Kbens4LBZ+RsnuU69fm1CBEsqaqaXdLRpWbWRHDgUzBl19
         fYbI24rWfaGLvsKNOWRXNSfV2gy4fenOkMWgmfafasqWzephNiIckSzAKMPHuDTeUbsa
         QRxPSYjc0tfe1187UUcY/QIaqS0xhODteYVmO2W6BGip8SuSZqVlDJjcX1m7ySvezEIQ
         f/4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795431774; x=1796036574;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wqx+iIyAhe2d4XXXu3h+vmHZKd4T7+bh2chBWG5DneU=;
        b=pz+eKKGXvy3SKAU/pf65JIDD5BRylFWQ3ZYM4/MiPj6VOrHsg7JkVtbk/bXL2ysYLO
         dhK6lORGeBxzDyQn8VF1Hc5NHa5zBqjm5betF8+tyGMUN8V3/zMH0u655yHqnb+f6VvL
         okYSBsM1ZZuQ2UVkjxz99xcQSzAEeN1wMz6sEYpsCwRd3qsAtH4xr0Z3B3WcZ2NQKkDf
         1jmPqxjuewhwMDrQW96WUo7QCbFAfN2U8N6TNanYTgocZ81AY4ixi2ZJ1w6Pvo1E+mVF
         Pd4zPlKOvfOUl+7MPlrcTizup1Jb6NUbFWTcpkGJsT1WkL0LFRV/hnD5k1/0JBeQixUV
         /zmw==
X-Forwarded-Encrypted: i=1; AL+hErF0MMRWyXQDOYxEqGulgdk3+2MUbIOdVNmzTf0jBpnF/XODjIeIdIbUfvSwB0P/dm6zfKIXRhKz8koVtcg=@vger.kernel.org
X-Gm-Message-State: APuU4Z8sHePY3ECmoO/DfUiwZbPWIgJ5TwPrNjKZeoi6PDW2oHmwgygP
	UCH8/9TOEBo8Ovvsv3Cktmf5ALyzDncvCJY+qu+zSYLBZ4J1TxezvQyF
X-Gm-Gg: AZFdTZdnIPgGiXlajCI7nD3IRWrinGxbwmND7kyKE3oGVuQBLwoHMEdsBEuskRpOEIm
	Po/Yo+wD7hHdnoiHJunosOAx1dkxI9u/3zTFQTdJ+PcJC3Wg/vdiRg1YnDDQE5sFL9ARhUEIzMP
	rPnnKtshUFdUH8y09boiwGRqZSFuk1j/YNPAwZLKzX7oE3J5D/rX8ohKte4sP1ik94392HkMjv1
	z3JHLtKl1pn5mcllS1xHzK9XsxdN20pcp2cvTZbI+YP+kivdtqM2dcZM7Pp9HuxM0ASZG0M8xS6
	dx5y5vqnORfBWIxbw5wU9O0zJ22Ku/r3DqA742RzBLbmUZXCq9fhv/ZqBDge3mG0Zn8QV+J12qI
	dCQMu3gK893Qvsn5LblhmkLAiCN0riuJ4waWtu0hj1tmzgy5CT0WLtCmsk4udcNJQi0KOCR4QKA
	mUBd+xIqQdGRGkq+E33a6V1f3BC6kemNqyOqbbFfOI/15OuAGr/K8FKXVkgjV7UqdrJWQI1utR+
	PWTkWXcQsy2ISZB+ffQl86HF1UYBAfP6prTOH6rKxVjtAhApn6UrnKx9BZwRoHFRh1Z8DOsqq35
	fqb8pZSCPJ2CS7xh1pEUcQdhqdrwS9IhAZOvvQAOQ5ruZAW2GoTYpwUBwtieoqnsmJM15d9FG2S
	PTM3QHk4f+N1MNnHbSG8i7e9wDQ==
X-Received: by 2002:a17:902:d547:b0:2f0:33d8:f88d with SMTP id d9443c01a7336-2f03ee6fa4fmr177863675ad.0.1795431773646;
        Mon, 23 Nov 2026 03:02:53 -0800 (PST)
Received: from chenyou.ncku.edu.tw ([140.116.19.16])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f0c1aa3sm50380785ad.21.2026.11.23.03.02.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 03:02:53 -0800 (PST)
From: Chen-Yu Yeh <chenyou910331@gmail.com>
To: alexs@kernel.org,
	corbet@lwn.net
Cc: wy@wyuan.org,
	dzm91@hust.edu.cn,
	si.yanteng@linux.dev,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chen-Yu Yeh <chenyou910331@gmail.com>
Subject: [PATCH v2 09/25] docs/zh_TW: process: sync code-of-conduct.rst with the English original
Date: Mon, 23 Nov 2026 19:02:00 +0800
Message-ID: <20261123110217.170025-10-chenyou910331@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261123110217.170025-1-chenyou910331@gmail.com>
References: <20261123110217.170025-1-chenyou910331@gmail.com>
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

The translation carried no "update to commit" marker.  A
section-by-section comparison against the current English text shows
that every section is present, including the conduct@kernel.org contact
from commit f3f76d640141 ("Code of Conduct: Change the contact email
address") and the Interpretation section from commit f7e585843217 ("Code
of Conduct: Provide links between the two documents"), but the text was
still a mechanical conversion of zh_CN:

- fix leftover mainland terms (內核, 社區, 項目, 代碼, 信息, 文檔, 通過,
  在線/離線, 帳戶) and use 為 instead of 爲
- retranslate items whose meaning had drifted: "commits" (承諾),
  "ethnicity" (rendered as 種族 like "race"), "socio-economic status"
  (split into two items), "empathy", "unwelcome sexual attention or
  advances", "physical address", "official" project e-mail address and
  social media account, and "online or offline event"
- restore "appropriate to the circumstances" in the Enforcement section
- restructure the Responsibilities sentence so that "inappropriate,
  threatening, offensive, or harmful" qualifies the behaviors for which
  a contributor may be banned

update to commit f3f76d640141 ("Code of Conduct: Change the contact
email address")

Signed-off-by: Chen-Yu Yeh <chenyou910331@gmail.com>
---
 .../zh_TW/process/code-of-conduct.rst         | 54 +++++++++----------
 1 file changed, 27 insertions(+), 27 deletions(-)

diff --git a/Documentation/translations/zh_TW/process/code-of-conduct.rst b/Documentation/translations/zh_TW/process/code-of-conduct.rst
index 0266cd74a0b1..d6b253d3bac6 100644
--- a/Documentation/translations/zh_TW/process/code-of-conduct.rst
+++ b/Documentation/translations/zh_TW/process/code-of-conduct.rst
@@ -6,69 +6,69 @@
 
 .. _tw_code_of_conduct:
 
-貢獻者契約行爲準則
+貢獻者契約行為準則
 ++++++++++++++++++
 
 我們的誓言
 ==========
 
-爲了營造一個開放、友好的環境，我們作爲貢獻者和維護人承諾，讓我們的社區和參
-與者，擁有一個無騷擾的體驗，無論年齡、體型、殘疾、種族、性別特徵、性別認同
-和表達、經驗水平、教育程度、社會狀況，經濟地位、國籍、個人外貌、種族、宗教
-或性身份和取向。
+為了營造一個開放、友好的環境，我們作為貢獻者和維護人員承諾，讓參與我們的專案
+和社群成為每個人都不受騷擾的體驗，無論年齡、體型、身心障礙、族裔、性別特徵、
+性別認同和表達、經驗水平、教育程度、社會經濟地位、國籍、個人外貌、種族、宗教
+或性認同和性取向。
 
 我們的標準
 ==========
 
-有助於創造積極環境的行爲包括：
+有助於創造積極環境的行為包括：
 
 * 使用歡迎和包容的語言
 * 尊重不同的觀點和經驗
 * 優雅地接受建設性的批評
-* 關注什麼對社區最有利
-* 對其他社區成員表示同情
+* 關注什麼對社群最有利
+* 對其他社群成員展現同理心
 
-參與者的不可接受行爲包括：
+參與者的不可接受行為包括：
 
-* 使用性意味的語言或意象以及不受歡迎的性注意或者更過分的行爲
-* 煽動、侮辱/貶損評論以及個人或政治攻擊
+* 使用帶有性意味的語言或圖像，以及不受歡迎的性關注或性挑逗
+* 惡意挑釁、侮辱/貶損的評論以及人身或政治攻擊
 * 公開或私下騷擾
-* 未經明確許可，發佈他人的私人信息，如物理或電子地址。
-* 在專業場合被合理認爲不適當的其他行爲
+* 未經明確許可，公開他人的私人資訊，如實體或電子地址
+* 在專業場合中可被合理認為不適當的其他行為
 
 我們的責任
 ==========
 
-維護人員負責澄清可接受行爲的標準，並應針對任何不可接受行爲採取適當和公平的
+維護人員負責澄清可接受行為的標準，並應針對任何不可接受行為採取適當和公平的
 糾正措施。
 
-維護人員有權和責任刪除、編輯或拒絕與本行爲準則不一致的評論、承諾、代碼、
-wiki編輯、問題和其他貢獻，或暫時或永久禁止任何貢獻者從事他們認爲不適當、
-威脅、冒犯或有害的其他行爲。
+維護人員有權利和責任刪除、編輯或拒絕與本行為準則不一致的評論、提交、程式碼、
+wiki 編輯、問題和其他貢獻，或暫時或永久禁止任何從事他們認為不適當、威脅、
+冒犯或有害之其他行為的貢獻者。
 
 範圍
 ====
 
-當個人代表項目或其社區時，本行爲準則既適用於項目空間，也適用於公共空間。
-代表一個項目或社區的例子包括使用一個正式的項目電子郵件地址，通過一個正式
-的社交媒體帳戶發佈，或者在在線或離線事件中擔任指定的代表。項目維護人員可以
-進一步定義和澄清項目的表示。
+當個人代表專案或其社群時，本行為準則既適用於專案空間，也適用於公共空間。
+代表一個專案或社群的例子包括使用專案的官方電子郵件地址、透過官方社群媒體帳號
+發佈內容，或者在線上或線下活動中擔任指定的代表。專案維護人員可以進一步定義和
+澄清專案的代表方式。
 
 執行
 ====
 
-如有濫用、騷擾或其他不可接受的行爲，可聯繫行爲準則委員會<conduct@kernel.org>。
-所有投訴都將接受審查和調查，並將得到必要和適當的答覆。行爲準則委員會有義務
-對事件報告人保密。具體執行政策的進一步細節可單獨公佈。
+如有濫用、騷擾或其他不可接受的行為，可聯繫行為準則委員會 <conduct@kernel.org>。
+所有投訴都將接受審查和調查，並將得到視情況認為必要和適當的回應。行為準則委員會
+有義務對事件報告人保密。具體執行政策的進一步細節可另行公佈。
 
 歸屬
 ====
 
-本行爲準則改編自《貢獻者契約》，版本1.4，可從
+本行為準則改編自《貢獻者契約》，版本 1.4，可從
 https://www.contributor-covenant.org/version/1/4/code-of-conduct.html 獲取。
 
 解釋
 ====
 
-有關Linux內核社區如何解釋此文檔，請參閱 :ref:`tw_code_of_conduct_interpretation`
-
+有關 Linux 核心社群將如何解釋此文件，請參閱
+:ref:`tw_code_of_conduct_interpretation` 。
-- 
2.43.0

