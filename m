Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795431745;
	b=TuZiLJO6pJT292htiv9oBSN6b8mPW6Ru2S8pl/q1Thv8MUUMygMBKKNumK6JdXsRQFaK
	 uGP93EC2X37jnSI8eftDXCOIrLazUQwrL493D4/jB9j1Z8L1LJNhxVzkmpBatvxrzeNJr
	 3pWzrEexT3nCKGubiWWWDTMG9EeF3Y6M4y5GhEBjoTZJZeLnbkc/LKaImOCwayU/F/K+W
	 oLsDbileA5ASZTFqvT83pwKBh7sgcKxz0l2tVZJc9PrzrBwhamVVr5kdcsNDDEuwZxWq+
	 v0u3mQuxuYBT3yYgo+fU931EEhteSsCr2/PzLwVUL/cG+nb/xqQv3PybrZZHgvXmdVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795431745;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=dpHDgxjo5vKtcEiGzC5vTWmIlYONhB1xpyVmc6KAFtc=;
	b=IXexBgAkwgugo4+KtygDl2ikJ7Dmn6nCkCIMzsAhSic/BAVxMNgbXw+1m1hTMZytFJZ6
	 D1skPGf7e/Xv0KPrFgt751tyfAcLYdmAlTzx7gAOZO/M2P4uSAO3riKewjzxwNaZN6sey
	 xn55p0OwjSbinChm+uyx8gMfg2jlC+SJucd6jbzFhWzRN+rChCwTT8vvxamnfB2ZJ6eFG
	 0pCdjFzVJuegfPD7UpsjgXZw1OiqvbosgEg0LT5Bsm4dTWzd9h2zpyTQhViGs8ffDqBfz
	 CiJpqh6p1m8epBEdIVVtXyrrEZr4Gc6GwAaVQeUGsVv0jqJrMuCrpXVvq1Ru7Cyec6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dx3YruT0;
	arc=none smtp.remote-ip=209.85.214.170
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52136606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 11:02:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 52136606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dx3YruT0
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2f05e191b2fso1101595ad.2
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 03:02:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795431745; x=1796036545; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dpHDgxjo5vKtcEiGzC5vTWmIlYONhB1xpyVmc6KAFtc=;
        b=dx3YruT0ARLjuy+dcTkzYx5kxGV0p5gxwZmrY2OTXyfIUk3ubpa6chOFCdfWpkmpaE
         RPJ94WleWjEMfUstflJvhnjBnBqKk/bux0sVAVIjMz0XFXphh/SnOrBEet43uNzujQlK
         /wijNacojjLFfVtiud36HE25BKIlka/XgxYX+/XsAjjgYHtwB7bZcLzffGzwdEmIFWMY
         CKFjS04Zfofbox7Me+pfQ16hs/AtOtpKM1LbxURrAZo1TWW8sJlaft3BJCu7XM3vW5tf
         t7bvigOVy2Txd8ryD/34Y++cQxYdyWZIDum35SSFkNGVyRrWT0ymAPQ62ZkbK9+qBvz5
         09RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795431745; x=1796036545;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dpHDgxjo5vKtcEiGzC5vTWmIlYONhB1xpyVmc6KAFtc=;
        b=dhOK0hxCPxW6UkoSyxDBFqTTyQrwpnYdRtni1lJZfGBfduiD1frYIL2XdFEQ6HmBEB
         NsOCXcfSCXKa4SdgelG7qYnO7FvoG2iZwu+zdscRPAYcYJ0GT9sK7litMCvaqjOBnY6c
         Stl5DbCcoj4oFJEpKlwbtSck2hgPDGO4xzuL1stlLvpdtKqSSdOCF49tiQJ+wnBmFhl2
         26tS1WNHDTD3/Vx4Dy4pqSLn7w+QTZHqzHuYRbwlmujdUVkb2pRJl1j+nwWCLCtgoI6H
         jYE/WUHn1W/KN5bQN6PBmJGQ239kOgdygbkOYujjm7TKROey3MZLXIJqVURXU8qQ8n2x
         U7dQ==
X-Forwarded-Encrypted: i=1; AL+hErHevWJnbXOVrK2fBZylgxWcd58Ojwu2wNwLxrxG6XjgrnTbVnhmuHBxt9Mbtq4ABFAFW9NG+rYkn4n4kwI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+NU7K6mUxeJURUV/6aeyUXUTm8Rn6h7ApiSMYkcWnER4r14aMj
	/7dPcJuUyp4ZSdYMRITnlnXLZHDJdYvXvMmPczOnJbkMbvIjWVvD89BOIva5I50P
X-Gm-Gg: AZFdTZdL1DfvOn68n0Fsi1mfpAH0ppV+wfvT4/+fn/xJxVKLfpQNn7FpOY8FJoBuuDF
	g6mXiv+3PevUtJHOVCj7cY7RL+uHK7/8B55412JLjH/8ypxrVQs/dJw3Ec5K6OsimYql6asF993
	7VUNu85Umc6hJgWehniGwKLDXoxNE7rhwdJvQ+GeJKVneXlSiMFnTwptMCpYytm4t3e60eFtu4y
	Ql/nrzceGcYalhFKddgBowDfiQzXyu7BR1FkEPhluBsR+5CZg/MGP6NOQncUqeMEx1gqMG7nChE
	sSWnKDGoXuixA9Hm23kvqHXfrDZLhbn5TtAHSf3EZ8lkUxB2lY6NFq+lyfWP3RWBbGpmZJDZcFC
	rnawoM63+QcOmIkokMW86c5zUui/yD1i9sC3z8eEOsbzMU68v++30wSXxhGBUNwWXEK3Qqo4Kmc
	yLbpa2VOvtJR9wUllMaiLOTF55w7bS1KQIcoo9oBUsZs3INRn1hkYfIOGrCfip+tlZFP/KYoJfV
	MX6IaUxcCPdXKbGjPu8PIArkfcrjlqsIrA0hRPkpv9HcwI7qSY7OYoYyGuz45Drbxv1wKj1Uwcf
	SQQUUT+3qU4OoNzlg5BhXFr7eK3Y2fCSy3IXihwwz23BS/0c9Qqo8XjaSCci9PuesyhMo8IGgBA
	egtj+o14vITENqXZwfpjLKGrr
X-Received: by 2002:a17:902:eccf:b0:2e9:9263:a58 with SMTP id d9443c01a7336-2f03f0c2295mr177401605ad.1.1795431744564;
        Mon, 23 Nov 2026 03:02:24 -0800 (PST)
Received: from chenyou.ncku.edu.tw ([140.116.19.16])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f0c1aa3sm50380785ad.21.2026.11.23.03.02.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 03:02:23 -0800 (PST)
From: Chen-Yu Yeh <chenyou910331@gmail.com>
To: alexs@kernel.org,
	corbet@lwn.net
Cc: wy@wyuan.org,
	dzm91@hust.edu.cn,
	si.yanteng@linux.dev,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chen-Yu Yeh <chenyou910331@gmail.com>
Subject: [PATCH v2 00/25] docs/zh_TW: process: resync translations with the English originals
Date: Mon, 23 Nov 2026 19:01:51 +0800
Message-ID: <20261123110217.170025-1-chenyou910331@gmail.com>
X-Mailer: git-send-email 2.43.0
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

This series brings 25 of the zh_TW process/ translations back in line
with their current English originals.

The "update to commit" markers in these files cannot be trusted. While
preparing the earlier process/ terminology series I found translations
whose marker named a recent commit while the text still followed a much
older revision, so every English change in between had never been
translated. checktransupdate.py takes the marker at its word and cannot
catch this. Each file was therefore compared section by section against
the full current English text, not just the diff since the marker. Each
commit message lists what was added or removed, and the marker is reset
to the latest substantive English commit.

Mistranslations found along the way are fixed in the same patch, and
leftover mainland Chinese terms in the touched text are localized.

Not in this series, to keep these diffs reviewable:

 - Whole-file terminology unification (e.g. 補丁 -> 修補程式,
   許可證 -> 授權條款, quotation marks -> 「」) together with an update
   of glossary.rst. This will follow as a separate series, so some
   files still mix old and new terms for now.
 - programming-language.rst, whose current marker points at a merge
   commit; it will be resynced after 7.4-rc1.

checkpatch reports "Unrecognized email address" for some lines in
2.Process.rst and submitting-patches.rst. These lines describe tags
such as Cc: and Acked-by: and trigger the same warnings in the English
originals.

The series is based on the docs-next branch of
https://github.com/kernel-zh/linux-zh_TW.

Changes in v2:
 - Display the zh_TW path in :ref:s that point at zh_TW labels, so the
   text matches where the link goes (Weijie)
 - embargoed-hardware-issues.rst: refer to the zh_TW security-bugs.rst
   by its path instead of the stale "Documentation/admin-guide/" :ref:
   copied from the English text
 - Restore the tabs on lines kept verbatim from the English text (URLs,
   quotes and examples); tables and other lines with CJK text keep
   spaces (Weijie)
 - 1.Intro.rst: translate "3-clause BSD" as 三條款BSD授權條款 (Weijie)
 - Collect Weijie's Reviewed-by on 01/25

v1: https://lore.kernel.org/all/20261106113142.706783-1-chenyou910331@gmail.com/

Chen-Yu Yeh (25):
  docs/zh_TW: process: sync 1.Intro.rst with the English original
  docs/zh_TW: process: sync 2.Process.rst with the English original
  docs/zh_TW: process: sync 4.Coding.rst with the English original
  docs/zh_TW: process: sync 5.Posting.rst with the English original
  docs/zh_TW: process: sync 6.Followthrough.rst with the English
    original
  docs/zh_TW: process: sync 7.AdvancedTopics.rst with the English
    original
  docs/zh_TW: process: sync 8.Conclusion.rst with the English original
  docs/zh_TW: process: sync code-of-conduct-interpretation.rst with the
    English original
  docs/zh_TW: process: sync code-of-conduct.rst with the English
    original
  docs/zh_TW: process: sync gdb-kernel-debugging.rst with the English
    original
  docs/zh_TW: process: sync development-process.rst with the English
    original
  docs/zh_TW: process: sync email-clients.rst with the English original
  docs/zh_TW: process: sync kernel-driver-statement.rst with the English
    original
  docs/zh_TW: process: sync kernel-enforcement-statement.rst with the
    English original
  docs/zh_TW: process: sync management-style.rst with the English
    original
  docs/zh_TW: process: sync security-bugs.rst with the English original
  docs/zh_TW: process: sync volatile-considered-harmful.rst with the
    English original
  docs/zh_TW: process: sync 3.Early-stage.rst with the English original
  docs/zh_TW: process: sync coding-style.rst with the English original
  docs/zh_TW: process: sync embargoed-hardware-issues.rst with the
    English original
  docs/zh_TW: process: sync howto.rst with the English original
  docs/zh_TW: process: sync license-rules.rst with the English original
  docs/zh_TW: process: sync stable-api-nonsense.rst with the English
    original
  docs/zh_TW: process: sync submit-checklist.rst with the English
    original
  docs/zh_TW: process: sync submitting-patches.rst with the English
    original

 .../translations/zh_TW/process/1.Intro.rst    |  18 +-
 .../translations/zh_TW/process/2.Process.rst  | 182 ++++----
 .../zh_TW/process/3.Early-stage.rst           | 192 ++++----
 .../translations/zh_TW/process/4.Coding.rst   | 416 +++++++++---------
 .../translations/zh_TW/process/5.Posting.rst  | 121 ++---
 .../zh_TW/process/6.Followthrough.rst         | 247 ++++++-----
 .../zh_TW/process/7.AdvancedTopics.rst        |  49 ++-
 .../zh_TW/process/8.Conclusion.rst            |  25 +-
 .../code-of-conduct-interpretation.rst        |  16 +-
 .../zh_TW/process/code-of-conduct.rst         |  54 +--
 .../zh_TW/process/coding-style.rst            | 286 +++++++-----
 .../debugging/gdb-kernel-debugging.rst        | 104 +++--
 .../zh_TW/process/development-process.rst     |  12 +-
 .../zh_TW/process/email-clients.rst           |  78 ++--
 .../process/embargoed-hardware-issues.rst     |  53 +--
 .../translations/zh_TW/process/howto.rst      | 186 ++++----
 .../zh_TW/process/kernel-driver-statement.rst |  24 +-
 .../process/kernel-enforcement-statement.rst  |  59 +--
 .../zh_TW/process/license-rules.rst           |  86 +++-
 .../zh_TW/process/management-style.rst        | 294 +++++++------
 .../zh_TW/process/security-bugs.rst           | 296 +++++++++++--
 .../zh_TW/process/stable-api-nonsense.rst     | 243 +++++-----
 .../zh_TW/process/submit-checklist.rst        | 159 ++++---
 .../zh_TW/process/submitting-patches.rst      | 346 +++++++++------
 .../process/volatile-considered-harmful.rst   | 115 ++---
 25 files changed, 2108 insertions(+), 1553 deletions(-)

-- 
2.43.0

