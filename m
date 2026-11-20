Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795179927;
	b=yCMlTYGgcLeBNMsJJOTY/7tYBdqX9GA/L7zagqCeKQv/81qk/RkFk1wQH8+x08ttn40E
	 2ZbNX26LH9kZ1bKFDY2VCBxKOqicpFmxAgrEO3hKZLFZsE+e7gGlcQSbHZM1plrSOJ9xr
	 fV3gkdJ2nC9k6UokUqqGgB3qkxnGXeFOFvle4IMmpibevuanLYvpDDs01cKG/dbiwlrTF
	 HfZjhudQTHz06fhJhG+a274tGUwtvHDEXzGuLhCPIQT1FxUrOLfqjsYh2OtmYs0xlQ08X
	 EYgkM6XbOlOI10T63D33U3GxDJs1KDnbYPlIx7YCM8w3adN+et/lQwtnuHZzhGdJBnw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795179927;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer;
	bh=gqmSsujEZXQg/C2ZCfVpBFjystcF2wHK9RFK4L6jPuo=;
	b=m9wv5DIlpwfwJiZnpcm7Hq6SOTC2OlH30wN97EB9c84GEp4EoKDCByxyM5s8H/ZutK2l
	 mN2lBpAadkaTWkWIQ3i+LXr7uMMAXOaLaP8tipCkzEfk+yqaof1HNZVEarNH9NLCrDCnl
	 gR74hZ1qc/YR7CxFEBTw9f2CimKyOU5x0aj+DlIOSYoyOVAMHmS89fw88UT8t0gpsf4eB
	 6jtAjXOyMPWJBXYNmL/RRgXLCFAn5k5ONn1G3KMBFu42CfPP8bsx6EHuQxMqpIrun0Rhq
	 I9aQWQ+urFA2QmYrtJZ7HEsx2UcCEOlaj6dTLjvLCMqJWfEQSpnfdqZPAfFNo7B1RzQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=k+CkSXp9;
	arc=none smtp.remote-ip=209.85.218.52
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BE9C60A2603
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 13:05:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0BE9C60A2603
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=k+CkSXp9
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c4d581da0aaso111511466b.2
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 05:05:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795179925; x=1795784725; darn=vger.kernel.org;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gqmSsujEZXQg/C2ZCfVpBFjystcF2wHK9RFK4L6jPuo=;
        b=k+CkSXp9kOPZceCs9rssE5gepAg2i/1PPVHEemu5533NMPs8XHYiODjHzOaN/FNCeq
         KorhfoGRjk9IeoM+y2//W0rltSlIOZwdCZ5j6QhkIr70d2qNugpQdykprr4fz/ev8tPP
         HplAT6n1lu0UX3m8W4wY91p3bNRUaHNSC8IKlaP/q564MQ++qkRmNbd0koEr0/uZyO8V
         hrpQkp4OyXEDTrX51G0Cvh+OIaW+sduZIlHJC8HPiZInHsySuMOV/SdzZuiie3v2dOQs
         WuZBczTi9xhxVnjlFffyHWhKZ8T7KESSbVdfSgJx1uJvouLrYtmPLhSewGTC1eV3fMNV
         scKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795179925; x=1795784725;
        h=message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gqmSsujEZXQg/C2ZCfVpBFjystcF2wHK9RFK4L6jPuo=;
        b=C9AK+isqVkKUPrvHaKOshlkQUDDC3zmC6pmoHhW8D1K+cwcwZ2JdbJSKIf+I4gdZLL
         7oY8VWxuMjOdZ/TMz6aL2mER+c9AHT+WF2T1rw1w5aW3wC40AflLv2DgjrCXV5AVdW0l
         g5mDFUaLrMcIAMujMeS129i7h0XlL1ycJOIEuTYDHJBqD3Sfk/1QRXhpS8uiT2PnIJL9
         eRPBk8zYe6ldvAmSEiZAX8Nj7zBa7VuG9fjqjPk8M6KE0gJs7wmebYknKIJBSU3VxO8s
         FHYR7NqjRdCY42aMN7hhOjIAzj4dIySD306zu+tEkgGgBrhPlaEzqxtEL46LAFIkCk9T
         ms9w==
X-Forwarded-Encrypted: i=1; AL+hErH+4bo3iNNhpgB/ug+PMjebb3/EiSYP/2HsC1LnXY0kLhxswajeYj/Xd8rDcZPzBtxlhUwaTA6pCm386sk=@vger.kernel.org
X-Gm-Message-State: APuU4Z9HGqY0aBdMPDakFg2fVcVS4CY9nP/3mlgz+ihFZxZPD+cjjETI
	y/qsY/sx1sIPQPHg5vWRPk7KWDRQITepK+7FdLluhI4lb1IThE7ZTLXA
X-Gm-Gg: AZFdTZdn/q7dmrUYyVuCEIETqHQ8Zsfd9i4CJmG1KkcuHzA2iIpOnWX86z+6PLP2GGh
	NA3Vr9/F3E9Xs/hW/YSB9m3QqrSMrbAFXEqQ6BAuJP6MCq6uvKO/oXIYfB9YSpuis3tjYk2zqzz
	jLZn3NDNx2NJ2JVNW96oGjyqaXr690w+zqod41mBd+9qcLWw3RcXdhUKezGtUOQRBVcYozWIoqv
	hvaGBOOVxowbsSCFJtU56elP8oasoACNX6kvlOU6zo8j+cjSHVwWr4S1K5/WZpHB9+nRxg9h+Q4
	Z9uK3fDXMtMqHMBZQCp5c90siqVwTjXKfB2S4w8bLzo2JMowlIND0IX2L7o1GqJwh7JLT1ha0mM
	Vh2yrmXHq2cNLH2/qogx1mZhM3ZCXZafZAA5NlYJyjaSu0a3ZDmaGrawiP80lN5Sf1g0Q3j78IQ
	ErI+f1tp7P5praF8N7H15qTpEsDLdOyEl9feY1SK6UM6ffKO+xEOe30QaNrrZj/bDLHsyhDUW9a
	ZAvTYpsQcmCYEVgB+9om+wqS0sgCxgHnAo8ImeopuvFzmym13xN2HZ5iLl6huokW8+Tw1VrsNpg
	dsf0shkLREmGqnCpdt2db3lw31Za9ns/utIF3vxDejyC6YEM0DCzi+35
X-Received: by 2002:a17:907:2d9f:b0:c50:5802:f665 with SMTP id a640c23a62f3a-c513a99aa7fmr319750966b.15.1795179925318;
        Fri, 20 Nov 2026 05:05:25 -0800 (PST)
Received: from localhost (c-85-228-45-68.bbcust.telenor.se. [85.228.45.68])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ae8ce16sm95100766b.37.2026.11.20.05.05.24
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 20 Nov 2026 05:05:24 -0800 (PST)
From: Eli Billauer <eli.billauer@gmail.com>
To: gregkh@linuxfoundation.org
Cc: arnd@arndb.de,
	linux-kernel@vger.kernel.org,
	Eli Billauer <eli.billauer@gmail.com>
Subject: [PATCH v3 0/8] char: xillybus: Fix issues reported by Sashiko
Date: Fri, 20 Nov 2026 14:04:54 +0100
Message-Id: <20261120130502.17056-1-eli.billauer@gmail.com>
X-Mailer: git-send-email 2.17.1
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

This series is a follow-up to the previously submitted patchset [1].
It addresses Sashiko review comments on surrounding code. This v3 series
is the result of Sashiko's comments on v2 [3], which in turn was the
result of comments on v1 [2]. Another reason for this v3 is to rebase
after the insertion of commit 4dd10fbbeb9c ("treewide: Convert
devm_kmalloc() family to the devm_kmalloc_obj() family").

One Sashiko comment from [2] is not addressed in this patch set:

"Can unbinding the device while a file descriptor is open cause a
use-after-free in xillybus_write()?" This remark is correct, but
will be fixed in a future set of patches, which makes the PCIe
driver hot-pluggable.

The comment about autoflush_skipped in [2] was repeated with a better
motivation in Sashiko's comment [3], so it's followed in this patch
set.

Regards,
  Eli

[1] https://lore.kernel.org/all/20261009074557.19996-1-eli.billauer@gmail.com/
[2] https://sashiko.dev/#/patchset/20261109112800.48663-1-eli.billauer@gmail.com
[3] https://sashiko.dev/#/patchset/20261117115902.41359-1-eli.billauer@gmail.com

Eli Billauer (8):
  char: xillybus: Improve sanity check
  char: xillybus: Safer access of unaligned pointers
  char: xillybus: Return error in fops read method handler
  char: xillybus: Rely on FMODE flags in poll method
  char: xillybus: Refactor flush function
  char: xillybus: Correct handling of wait queue
  char: xillybus: Avoid indefinite sleep of work item
  char: xillybus: Cancel delayed work items before teardown

 drivers/char/xillybus/xillybus.h      |   3 +
 drivers/char/xillybus/xillybus_core.c | 109 ++++++++++++-----
 drivers/char/xillybus/xillyusb.c      | 166 +++++++++++---------------
 3 files changed, 153 insertions(+), 125 deletions(-)

-- 
2.17.1

