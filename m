Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795752941;
	b=Io8sRWX3hbueQ6SwhhK62xxw5rU7oOGRc6POVprKEcMQEDDChSn/eDXqHgQi6vJtBvCo
	 1aGQPSWtHRVpBLp/IkHTHmlpMHiibuT1nQ4gFKwpqLpFxiuySxn5DMEr7B5O29nc/5d0A
	 Wmol6TuH1m38lnO8WATWgfJQj/KIWYQ2/hWxN395hHCHAlqiFaRxD+Ojjz9adFIt37PSK
	 g5VqpdNTgioV/N8p0TNHWhGBx9oowAZSuZHB6Nn1po8CEPShZPjKzOKNmK1mjLZUch9K9
	 272vHeJZNhq1XgQh72SSZA1k55VyEhOZJ7gQij2xlsLsQ7XtXW8Ehp+R8nJC2szja9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795752941;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=bHf5cXXltkgpad2vo/4TSgTr50gXfdBsa3VtXa/31i4=;
	b=bNZa1EL3B13aL0JUUqT7/SRWrFryyP3m0fTsnateY9NCEVJffflSM/LdDAhLkLiw5MP4
	 BAAepcm0zMSURVpc1uMI03iJ3TTvoR+r+bMShaMhrYswysMrvMb+8zAzUkjiX8Nsn0xze
	 lnRjL8Tqhwz7QYGDxClYxiOMvopSjzJF4YDYehJ6KPRL7OHsHTzXDbU4eOL/jIjEApzKj
	 MCmIlQlH6ZHjquRwSVgvSCrK9ssGOetc+N0FUqNgIeQtTXc9xUuXcUVPi7fhdZNwfuzsq
	 4BQZZNOoGuCyK1kFDtVTYq6+Ea5IWqWuXnrDnWBEKxG8eDYpp/mV8+dh6TXmPbvBMuA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b="QOM/UIr7";
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FBC2606A31E
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 04:15:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2FBC2606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=QOM/UIr7
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4bb70074ab2so81266285e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 20:15:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795752939; x=1796357739; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=bHf5cXXltkgpad2vo/4TSgTr50gXfdBsa3VtXa/31i4=;
        b=QOM/UIr7Ult8U4nZY1f0BqSwC+4kTp0bzbhKCPnhI/erSvvH8DsPAmohIbPwwdTWNN
         sQE6r0/wGWihhyG3mX7KuXSNXEqfz7aTqM6Vh3B9TCINNB+PxRrCUfKxFFiCvfd+wPAO
         IQMAAmmBO56QgEqHb9r4id46ByAgUkUK/0v8RSpD9voEMMYXu8mkmvkWgxlM0x14+euh
         qF4P5npcMlzD7Rtmh0yxiBJ7j71c5Tyl0FzpZxkHcW5XrkTMo3RzDn1nJznNpQUOe3mw
         eYC6SBQ46KWwlTBfsvBavtNTZBnO2as3rmD2lmeHnVuUlQuNqPr+/SOhgcHb/N2ETzDB
         ULuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795752939; x=1796357739;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=bHf5cXXltkgpad2vo/4TSgTr50gXfdBsa3VtXa/31i4=;
        b=fUGWsvyb4DR5aeiu4IipjBAFE507Yt0NAFpTW43QKz/zMLBiAzk7G/5kvUhaNrizzh
         crhRN6yFsgZ6d5r2RT2NsjdBz41DkUYm7wLaLRBY+OnT1CzcO5g5TF23VCmAebOIIskB
         BInRpSS0X1fgHrnMvO/6rNZQNEMPUH7lPCb047DwBedmL8kISpBbutH1fZxUM2C1Sf4h
         n0lrvqUwasKhLHKuhH55kviH+UkC+cl2GXVeCH7/hpLR49V2RA4G6T51t7n7cMyIml5N
         LPZH5E5Og9mZtLk0yNhz0c6l/GClx6adAX7MrLLX74s+1tEMMkdmQ9hMJW1sazE8Bs9b
         0kCQ==
X-Forwarded-Encrypted: i=1; AL+hErHHnnQU8JyQz73aUY/oBQ7n8r1wDkD1TgRv/GNUhqwLpa/KC+XKZRI7XJJxFjs/4R3CZY+zN9fX5VdNp3E=@vger.kernel.org
X-Gm-Message-State: APuU4Z+AQlfYlTr3ldC/w1vIyYtBuqqDp1finPY6ul4FQF8BKA/E9jOl
	R0pjO18J9+M7CSwXRCRhxuy9MlTZB7JZLH/Dj02l4ODcrKdEVqdbW5Ft+iZ+vPvJrhQ=
X-Gm-Gg: AZFdTZetjEsJH+iKfDaHTN9CvEvA+yI6HPrvV11lS1B87KIYjqJEbXtzi8Ab2wp3yWy
	6O4kVfmF9t627CqUXYhJjUy81Q2Cvz/iz6IbIcn8iayO+709BXusmEL/G7Sw08RhXr4R7ztMK4i
	/z8hLnltSgi7ze3IcARBVKkAlBSjwszX3sGHInFu6bBcs4Ppi32ew9on5Kdeks9WDR0u89mHZSg
	COlKZ5ROSdLe7xra9bPTQvNduIVmVx/8344tSGt6cOkxlC/Jj3IKSziFRz6YoKAmYxbSK1sJmNj
	3K4kNHWIRmdVJ/caM3XnCIDW+psSGseFPyljZ6YSFaLEXFbHKxRmyM7gu4KvXr5et84rgai1rBL
	n+jjOE0Tzs+nmAX1EI1Wxtx7ZaJ/qBrGFNw7UOJxPD9jVzIUlsJSSYaigP3G6ExI5Zzlxq4fBmR
	FRH0mzGp9pErOh7CFqBnqaa2izHS1Asaa65sTsg+2FGp58bWb/O/ktSHPS6ZRgCPZwksVrOt1SX
	8NTqOyVlTbzNFACjyFlqzDeXzKF+NEkGfxzbEhCW9mBamROJ1nwrcbjbTDAXB7zfzscJFoOCLxs
	73TJW5BPwIg5pwxzH6s=
X-Received: by 2002:a05:600c:1384:b0:4a2:1612:6367 with SMTP id 5b1f17b1804b1-4bb88816c44mr470580845e9.15.1795752939556;
        Thu, 26 Nov 2026 20:15:39 -0800 (PST)
Received: from [127.0.0.1] ([109.79.27.52])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb88442995sm686987465e9.2.2026.11.26.20.15.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 20:15:38 -0800 (PST)
From: bryan.odonoghue@linaro.org
X-Google-Original-From: bod@kernel.org
Subject: [PATCH v2 0/3] media: qcom: camss: Two routing fixes
Date: Fri, 27 Nov 2026 04:15:29 +0000
Message-Id: <20261127-camss-routing-fixes-v2-0-b7152f0af49a@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/32NzQ6CMBCEX4X07Jp2Y5B48j0Mh7YssP60pAtEQ
 3h3C949fpn5ZhYllJhEXYpFJZpZOIYMeCiU723oCLjJrFBjaQwiePsSgRSnkUMHLb9JwJlz5Rp
 XnVrUKptDoj3I4q3+sUzuTn7cprZGzzLG9NlvZ7P1/j/MBjTohoist1giXh+UAj2PMXWqXtf1C
 975VzzJAAAA
X-Change-ID: 20261122-camss-routing-fixes-b178bdb84f20
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bod@kernel.org>, 
 Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3835; i=bod@kernel.org;
 h=from:subject:message-id; bh=aycJqlvHjcbzLgomZhj0p03rDZMloDfOoT2gyU2UeYU=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBrCQPnGrJsjZzNLDuNRaTCr2RvMuc79AkF34iYH
 9/Ps9azxVuJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCawkD5wAKCRAicTuzoY3I
 OgFDD/4/u1qzcCepVc4Uy/d6YkUynbhm9fPpqrLIaLPiM2uEkjMDhnGkBGnS68S6Fj5okvWrnE7
 K2jcz6yNlIq0P4Vz7CqK6nGFKrQlUMGu5F6b+TMI8f37W/G7KZvjXQrZawTxw8+69uXO0cqX3Da
 peU6vapMxK7M1nj9GF9ZHr+szDmGvtj1Kd2xor+QLSNh1cVH1bq/722EBra0z0bQx56MKFgPv5A
 i0O4za1/MqSz9qpWwcL//Wo0AoOB3HWFamRU16Pnvu1vO3ok6xL87G2WCUW6dYQxF56uqKtBoPx
 vhzXli+wI4xQj6fSgHIKrpIzxSUNKz68Z7rIU8lJBcKl++fSK1YGHwpTdLnf3wTYUCn6ikf4OwD
 sHpWF02ievtjSIHaTeTxPcT8drrhvWtH4vkUNMwFM0n4dzyjZWqInTPB8m3NY3TZzuozfnAm/lD
 J3EY1uJuJ8k5JQHSBKdFRsC6ThEWmCZiPd4AeAsCu4q9PTXRjlZiv/dLVAilCZ+R4CGksOIS6+p
 g+RaIdJE3Y0dLnUnBzGZ3mtHVgaAShqNTKHKzryuAHzGJrbQkowNRW5HHA0SU/DZ0GasL7xZYKX
 vitoXIzD3020U6jZAxCzIQ0o98x4LMpqBdwYaazNBLEvFkx/3b/I1p7zoN3rcPNCPDwpMmhfvxN
 96DflvC+G9MpISg==
X-Developer-Key: i=bod@kernel.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

v2:

I reviewed-by and then wasn't very happy with adding a new field
to CSID resources hw_id because this means we would have two
identifiers despite already using csid->id to mean index and hwid.

Bite the bullet and make the conversion.

This is the way - bod.

- Adds a precursor patch which provides a .id in place of CSID.

- Converts from using csid->id as both hardware identifier and index
  Instead helper functions make clear and explicit do you mean csid_index()
  or csid_hwid().

  Several callsites need to be updated to make this happen, but that's
  life. I'm a big fan of patch granularity however the differentiation
  between index and hardware id must be done simultaneously.

  Follows the precedent of csiphy.id - bod, Wengmeng

- Straight drop of CSID2 retained. This is the right thing to do, CSID2 is
  useless dead silicon, already RB by several community members.

- Link to v1: https://patch.msgid.link/20261122-camss-routing-fixes-v1-0-0deeeaca2622@kernel.org

- Applies to camss-next from
  https://gitlab.freedesktop.org/linux-media/users/bodonoghue.git

v1:

This series lands late-enough in the kernel cycle and applies against the
camss-next branch staging to linux-media/next.

Link: https://gitlab.freedesktop.org/linux-media/users/bodonoghue/-/tree/camss-next

First up a patch drops the declaration of CSID2 from x1e/Hamoa since this
CSID doesn't have a corresponding VFE it is entirely useless and violates
our 1:1 mapping between VFE and CSID. Since CSID2 routes nowhere there's no
reason to keep it around.

Second is a fix for a longstanding error in CAMSS which as stemmed from
the original development of post ISPIF devices. These devices have a 1:1
mapping between CSID and VFE so the mapping we have given to user-space
which declares each CSID as connecting to each VFE is just plain wrong on
these devices and has always been.

So the second patch addresses that longstanding issue but, I've been
holding off on fixing this for a while since I believed it might require
extensive surgery, but in the end its quite simple to do.

Finally the third patch is a tidy-up patch which inverts our current logic
of continuously adding new elements to the src_pad_code switch for new SoCs
filtering those SoCs down to a default: statement. In fact is is the old
SoCs which are the exceptional case so, just do the switch for the old and
the default for the new.

To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
To: Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Bryan O'Donoghue <bod@kernel.org>

---
Bryan O'Donoghue (3):
      media: qcom: camss: csid: Add and enumerate an id field for CSID entries
      media: qcom: camss: csid: Stop using csid->id as both index and identifier
      media: qcom: camss: x1e80100: Fix CSID2 routing to nowhere

 .../media/platform/qcom/camss/camss-csid-1080.c    |  2 +-
 drivers/media/platform/qcom/camss/camss-csid-340.c |  6 +-
 drivers/media/platform/qcom/camss/camss-csid-680.c |  4 +-
 .../media/platform/qcom/camss/camss-csid-gen3.c    |  4 +-
 drivers/media/platform/qcom/camss/camss-csid.c     | 34 +++++---
 drivers/media/platform/qcom/camss/camss-csid.h     | 18 ++++
 drivers/media/platform/qcom/camss/camss-csiphy.c   |  2 +-
 drivers/media/platform/qcom/camss/camss.c          | 98 +++++++++++++++++-----
 8 files changed, 126 insertions(+), 42 deletions(-)
---
base-commit: 91ff71dce5e770e7965cb3b09c87f6d334c6c4c5
change-id: 20261122-camss-routing-fixes-b178bdb84f20

Best regards,
--  
---
bod

