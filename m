Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795431781;
	b=5rDJsxtYTHnqrOPS2a9bIp7DJtnQNo8J51tce18ddqPJVhIlFw18aV67Wc3sT/JRh7+U
	 sVWu3xZYwjckiLwhUjKqUEtF/9/cUoUv/Y4NwLgndbNxQBfQ2fWb8OZPsbaHeolfq9B+f
	 Ql5rEkf1kISd0LbcwM/D4xMSqv9fJfQ0+mTrSwt9BPGxloCGIi9a8+86uui1b3G+OKcGP
	 9ZLeWPSsrQOiuQRqZUR/cXnPflGSgEPZQVNuOV0EiI+tzLZUOc1ArKU4kSSjFvLIqrJ7i
	 5pUmfi4iROG+W4S+KNRLjkT6BBKxZKmyIBxLBkGjAt3OWMjclLN5klLXcu4FPQPYliw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795431781;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=47jS88Ka87svuDyf0K4DC+GO0aBmX9P2j0Nyp9C+Ix4=;
	b=kOPOIyZuVIkd3yoRw/IrHjzu0bsMLQac4CuUN5/kA5fxLSu8EBgBcx728RvuQJLszhN2
	 COVIAvEERZNlhOVrnVt92Qs3KTDO6M2MRZ2KDNlDMazUp9R2xTMyTqfAlIKB+u7HibDan
	 4SGiy+6e9vDmWHNWyaFTFd1jcLAm+VHMiNkMLXUlF9FBcoep13fBEXh5FuuFRew5G7OnQ
	 h+PfNnXty3SiZLBUp2xlGkGwxqvMA0zz2DBbQGSB71eNnTqGdfepWJG0TPI1B+b/s4VkI
	 2Nym8EF5wDdRrljmIJvmTJGv0rg8PG+aNakU7UYCsJNbKvPQVRbzZQCRTPE7qiAC1hw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ocdymkwb;
	arc=none smtp.remote-ip=209.85.214.174
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5E50606A338
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 11:03:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C5E50606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ocdymkwb
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2f07de402dfso668125ad.3
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 03:03:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795431780; x=1796036580; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=47jS88Ka87svuDyf0K4DC+GO0aBmX9P2j0Nyp9C+Ix4=;
        b=OcdymkwbFaf5+YUkTOxt1yw8VEcsXE9K4oakwBcWEwMHvCj9EFNWD3IOcuaq5p464F
         8ept51muGSfoG1mcRnYlPu+zqJb0SQ7Ua0Bc+C0f1xw5g28AYuwUyx8UsSunGuT74XbU
         4alSkvX6LEaaEReOivbPnvkauTHKlrinZPcYKVCuio0jwTcbm7Yl0cLs2cBirJw9LQ8A
         CLsLEHxXI/wF7puAw3JH/rMtFaJoDS6ElwoDvbtTFyb92/9VYrtBvqeZH9P9SNtouUHa
         Jjxq0FyHO2LaA/gAILoVWh8AUuDN2f9oL4B19PD2UN8SFEbvc7zGq4GjND+tMFnVir7c
         LmVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795431780; x=1796036580;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=47jS88Ka87svuDyf0K4DC+GO0aBmX9P2j0Nyp9C+Ix4=;
        b=GHbySLybEgwCP53XFTBYS/UEEhZ4F27/PUf9D3+teHl6W+awKI5+OR63VevDKcS48W
         5gz8ZXeQEJVSJju+ef95PVAP92tfI8qZ+yN+bSHKMe9TBwU1MwtliA9S8CRfRDOkxK6k
         utYWKMSKxvb2XBB6V6jW2aThwv85JGMvxDR3iFfCFuy1bSlrCxJDrqr1INv4Z16vmXbI
         PpVJGJZd4yWLu7zykFg6xHBP8rSg4W41fGA7zsdM6fuHWZuaj2Cuy0hVAjcvv+JgI7QY
         mLPwKo8VnWX0j9GGHqhzhDMLm6Ri4zGVz1NzFOCYKkPX6kt4MolnY792gwECSk5yNta6
         R2tg==
X-Forwarded-Encrypted: i=1; AL+hErE6t4RjMmGg/z6/614RyQ7jGDCbIR8ynos/gklHcCOv62qxdGte50m3zN5cWNJ0iYqWuiMj7vIANh0ZhpE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/DKxYkwgoXYZn6oFsfCgkLl3fjSOsRm2BFUp+yDqSqHBoy37GR
	aappI15orz0x7bkHEbAy8MpLonIF5OoeCf9Ake1Zy2UZgXGNJnu2sLvy
X-Gm-Gg: AZFdTZdGyjS/WuSolssuVzWqzvTUJw1wH2RuKulJjP6Il2ILrtyn/bHeMnH+IRHXbpK
	hosy7EnXYctMX1gIdS8ZJ67TLXeic6DGfK4EUiCtNhEY6ksnflKm6vUkvvL0ilO39KqHk15zmXw
	cjCMsXrID2c9N8ylrmmPi60itaPoVwKWLGQ80BAlOPKmf2YXPoAQWkjbG+ILDZ6lGXXsS9KQ6sD
	layvXPxikfSQxaoXvLFAebWhIGcB9ehxYGqZOU+qMXyYYmgQPXqco8H//d8kzHpvPNnTaKQoNZE
	ME/BjE9858ml+lgDD7I+TIyThba2QUCvpxyXtvaowzDTXrU3P6kwy0MX2eFh4JRBW6d5gZIiXsa
	jXywRdHxfHfjdoB+F/7sK6ceBFnsUYuObaOUENNsHDTBmD3ZvZPyArZy4l+BEDmnpz+RQLenqV6
	WIj6tgks3soTVzv806OUebb8Jetfd9Tz+EnNP/Cfpb0sWBZOt0CdgxfuT3dV89Saj2TbX38Pckm
	foJIBCV8jefi1hFMKcXLc7m+Ys2s3X7gH6co9R7wu2Nedj21QXs3vjrhVYfgq2Bdhl1LWfAFhVw
	Ya5DuPnqOYlKOH8SWlhkDwCzTsUiGIy1rrJaILoMxsmyDVraoKao+RBRQm/Z6/6lQ5MTgp/xKNk
	Lr2Txf+TWDvFFeBb+IewYFHwG
X-Received: by 2002:a17:903:32ca:b0:2e9:5c29:9955 with SMTP id d9443c01a7336-2f03f1e871amr179469315ad.4.1795431779972;
        Mon, 23 Nov 2026 03:02:59 -0800 (PST)
Received: from chenyou.ncku.edu.tw ([140.116.19.16])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f0c1aa3sm50380785ad.21.2026.11.23.03.02.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 03:02:59 -0800 (PST)
From: Chen-Yu Yeh <chenyou910331@gmail.com>
To: alexs@kernel.org,
	corbet@lwn.net
Cc: wy@wyuan.org,
	dzm91@hust.edu.cn,
	si.yanteng@linux.dev,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chen-Yu Yeh <chenyou910331@gmail.com>
Subject: [PATCH v2 11/25] docs/zh_TW: process: sync development-process.rst with the English original
Date: Mon, 23 Nov 2026 19:02:02 +0800
Message-ID: <20261123110217.170025-12-chenyou910331@gmail.com>
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

The translation carried no "update to commit" marker.
commit 2b7703e15a55 ("docs: use toctree :caption: and move
introduction") moved the introductory paragraph above the table of
contents, but the zh_TW file now has that paragraph twice: once above
the toctree, as in the English text, and a second, older copy left below
it in simplified-style characters (軟件, 裏, 瞭解).  A comparison
against the current English text brings it in line with the full current
original:

- drop the stale copy of the introduction below the toctree
- retranslate the introduction and the title with zh_TW terminology
  (內核→核心, 文檔→文件, 社區→社群, 編程→程式設計), and rephrase "in a
  way which is accessible to" instead of the literal "可以訪問"
- wrap the :Original: line and the introduction to keep them within
  80 columns, as in 8.Conclusion.rst

update to commit 2b7703e15a55 ("docs: use toctree :caption: and move
introduction")

Signed-off-by: Chen-Yu Yeh <chenyou910331@gmail.com>
---
 .../zh_TW/process/development-process.rst            | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/Documentation/translations/zh_TW/process/development-process.rst b/Documentation/translations/zh_TW/process/development-process.rst
index 1d22aa0d3711..906e635cf830 100644
--- a/Documentation/translations/zh_TW/process/development-process.rst
+++ b/Documentation/translations/zh_TW/process/development-process.rst
@@ -2,14 +2,18 @@
 
 .. include:: ../disclaimer-zh_TW.rst
 
-:Original: :ref:`Documentation/process/development-process.rst <development_process_main>`
+:Original: :ref:`Documentation/process/development-process.rst
+           <development_process_main>`
 
 .. _tw_development_process_main:
 
-內核開發過程指南
+核心開發過程指南
 ================
 
-本文檔的目的是幫助開發人員（及其經理）以最小的挫折感與開發社區合作。它試圖記錄這個社區如何以一種不熟悉Linux內核開發（或者實際上是自由軟體開發）的人可以訪問的方式工作。雖然這裡有一些技術資料，但這是一個面向過程的討論，不需要深入了解內核編程就可以理解。
+本文件的目的是幫助開發人員（及其經理）以最少的挫折與開發社群合作。它試圖以
+一種讓不熟悉 Linux 核心開發（或者說，一般的自由軟體開發）的人也能理解的方式，
+記錄這個社群的運作方式。雖然這裡有一些技術內容，但這基本上是一份以流程為主的
+討論，不需要對核心程式設計有深入了解也能讀懂。
 
 .. toctree::
    :caption: 內容
@@ -24,5 +28,3 @@
    6.Followthrough
    7.AdvancedTopics
    8.Conclusion
-
-本文檔的目的是幫助開發人員（及其經理）以最小的挫折感與開發社區合作。它試圖記錄這個社區如何以一種不熟悉Linux內核開發（或者實際上是自由軟件開發）的人可以訪問的方式工作。雖然這裏有一些技術資料，但這是一個面向過程的討論，不需要深入瞭解內核編程就可以理解。
-- 
2.43.0

