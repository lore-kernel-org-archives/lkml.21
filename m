Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795645736;
	b=vGkIycjumydSWbkOf+AFRxIxRmwmkdPVgpltb8MBC+wDyNjwiVSxAU5mZxYOM2ZvDXKz
	 7L14GymybkiibpP+Weyx+hMxeOvrOl/A0DRmc1+F4G4VziT4R7EMfSUwa4BUxd3EqKg2q
	 t6MZ936l0fLGEYVDKpClRJJQ0kdRQTZkoeoMC2Jq6tFqMJpm9zyjbKFVbHrSBLgbql6E0
	 /ZZFcJ2bdMcuGfioIk+GLkItZCs7LFnlldFnaCmwWQ2D+GVoGgaMFZGXAYqDKUaXqftbN
	 hGbNmVhI6DHf3KweJjsyqksRU4uCMcVNwOWyDVQjb/gzN24zswdNZykiv/q8+Stf9Jg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795645736;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=iJKxUb/OYtiZmUaTC1b5p1/oY/CxsBACMnUtWish8DQ=;
	b=tka1xTy94zqz6GPm4rE2JJmRQNZ+XbxJ2uBguuuoNiADYOYMBV8DyEL0cZcXurNal8/C
	 fL6n4VK3mXTmBEzYbjMla9bIP3gebPRWdtbBa87d9fWyQn5wOXmhnI2ovkSLcs4OMnUx4
	 AX60GAugzIZsyUD+CFuljrgmMBHEcDqKK//cE1lDDV1/hlwmMPzLtpjFOT6Iv/294U9T8
	 9p7u0j+yRduVB0MZSB4Xz8sqUYztWd45URsFUQxIn9Kc9M3mRifilG01W+mZnifKC/QD8
	 mMCeJH5NwscFSFYltPM4RgbpEIEQMJuLNJLgAWeqHDaojhHf1dr12NlVUnL08zj9N4w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--elkin.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=QsmA+a3T;
	arc=none smtp.remote-ip=74.125.82.199
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA055606A326
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 22:28:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AA055606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--elkin.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=QsmA+a3T
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-386c3309469so2317902eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 14:28:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795645735; x=1796250535; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iJKxUb/OYtiZmUaTC1b5p1/oY/CxsBACMnUtWish8DQ=;
        b=QsmA+a3TL79/OwFEamU3b0vlvw0XNSzW0B0is2MtuGIg+SilAJ6tDWBJ+3mq/ZLmW0
         HST1smYjJjpYsEJfkFvReeABl6LUebKsHJsX4zOcPe9jB2MiVlC9Vt88gh9oj8y3HpqZ
         olZzE0Zi+AwFSJJB4xU6OOV7WjZIvRGKih7ELm9b4ZLh6WZe895YB+KNZdMUj3owK0H0
         i/kc0xAqHrcXMNO3xV6C/hisanGP0jQKA/LQANKkRaXOcI6gtff7uaoX+Vs1zcr1/Amw
         djv8ja1DHVtoW2wCWD3zzGRYkWt+TW7JBSQM3K82fZf+HOMVIn6gZaqX63QKlo9Bh5wG
         6Vww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795645735; x=1796250535;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iJKxUb/OYtiZmUaTC1b5p1/oY/CxsBACMnUtWish8DQ=;
        b=Vd9uG9eyLPX8G3KSjhAJrDnrmuYZqEHMNO6gjg1l1z+for/vHcMdQ2pF9NJIk4CmNo
         2iiLxHeOpqCFZ7+xWhTWSz8JIWL81qdSU91fUq/4D38iPAJ+ggOtpqvJj/fbzjxlXEUq
         mE4qMqotxC+7T/cWDae0JWDSzH6ar8Sl/OaZP6BGkywc/5qYM5/Tjp1XGCua+L8AlRNt
         8o4h85e5M7/ZQXPhWfjrh7r1KGnIsfoCuH8uwbWIDZ7iXMOSd0dMivovQWU94M2CY3fF
         hSbXP6JobXw9CrIa46O2qPlWiZ81hIu87mVEJhiBs9xgUag52vaGfN7KXmJGo1r50kCH
         CGZw==
X-Forwarded-Encrypted: i=1; AL+hErHbPtk9qRw442h0HcGfybgo5LbMZPKRu07omTAA2FiYmfPqG/gAPCDKWSAGbDWeH7nKHp5s0B/ZDm0H7vs=@vger.kernel.org
X-Gm-Message-State: APuU4Z+V2xq7rU2X4a6kot0HSJAJkM5cJSKEjSsjS20ryREyEzUrl9uI
	BJSXEw5YG164bdEha/BTN4xaudf7elD5PRK6ORAXnwizqg4QJX8SUgMcRFUwkxiU9qSyWH58QUm
	xAQ==
X-Received: from dybla7.prod.google.com ([2002:a05:7301:1a87:b0:381:610e:404b])
 (user=elkin job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7300:50fa:b0:384:6487:b155
 with SMTP id 5a478bee46e88-38570c359d3mr21814023eec.29.1795645734570; Wed, 25
 Nov 2026 14:28:54 -0800 (PST)
Date: Wed, 25 Nov 2026 22:28:26 +0000
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.1.839.g22a8290db9-goog
Message-ID: <20261125222828.1452483-1-elkin@google.com>
Subject: [PATCH 0/2] usb: misc: usbio: fix fatal URB resubmission and probe
 maxpacket bounds
From: Elkin Cruz <elkin@google.com>
To: Hans de Goede <hansg@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Antti Laakso <antti.laakso@linux.intel.com>, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, irogers@google.com, 
	Elkin Cruz <elkin@google.com>
Content-Type: text/plain; charset="UTF-8"

I am trying out new Clang static analysis checks for kernel bug
classes, and they flagged this code as possibly buggy. The findings
were triaged/fixed and commit descriptions were drafted with help of AI,
then checked against linux-next (not runtime-tested on hardware).

Thanks,
Elkin

Elkin Cruz (2):
  usb: misc: usbio: stop resubmitting bulk IN URB on fatal status
  usb: misc: usbio: validate endpoint maxpacket sizes in usbio_probe()

 drivers/usb/misc/usbio.c | 28 ++++++++++++++++++++++++----
 1 file changed, 24 insertions(+), 4 deletions(-)

-- 
2.56.1.839.g22a8290db9-goog

