Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795107864;
	b=RTlPLa8tTmuND7sszju/0otBPvuGDrWu/gwg2x8WWzl9dvOWJQNZr4nQmO6U2yOV3xs0
	 DdWKPI56aQ7YTSGStn9IqhIoW6wsSaVL1BJAkRIh9jkzTmBDnFFHrsnH9I3Xt3K4AVeZC
	 CNR1V9yjJ1vgxZ6WlvMRGhiKK5VKg/x1/SOyUZv70toodWWa3isqJNpyenGmH5ace/8cO
	 hJoS/cyx5OBeM4MhlXdm3tHFxxBqYe7IOhyfLc69j3M0OXs2g7FlUvlgEqOA96HRJYw99
	 Nfk7NJrjHHG8e+GuwQnsDoOrDbc47wRP/DwK7itbTTEaJj2NVCB/4k91KKLFy0jdASw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795107864;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=tbGvL9tZ+BYgVAO5FMDS+XSwp11ngMpDyW2424LSejU=;
	b=zWw7tZIchMDSFMXKMeUM2o68zmrqtCXqeobGgttEyoQZNfu2YauHMmD7/JCuo+muM+aw
	 hS9wIWM5eDQtFrFdhhdpVQrm5uQcXIEv7A8rht543YXhnA/CrLSTRXLQYCNDxxo6oQUYn
	 kCijnCji2ZO6Mgzz2Z5LyRFmUucoYtKm6/tdK32RFLnN/2XM1mUKsXan/CSZUsZs0IlSB
	 vbbIK3b+ZHLylNUeuz0QisC5IEA6HxyjsrHRCgNTN/5megfKtkpA0zt/q2P+G9TcF0MUg
	 A3UGekAU0SvG6JCfdrUVQvx6/0qgmmacF48BO2+WW5uqPJ2MI9sVX//vSKNJ0rVryRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=dgJ0q2jo;
	arc=none smtp.remote-ip=74.125.82.72
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A5AC60A2602
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 17:04:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0A5AC60A2602
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=dgJ0q2jo
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1a71dd190b0so6377289c88.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 09:04:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795107862; x=1795712662; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tbGvL9tZ+BYgVAO5FMDS+XSwp11ngMpDyW2424LSejU=;
        b=dgJ0q2jo/7wmzCjkkBaQyktbr2kyJVnbgxUwAktZwmw3Ka2wu9lGhG6P1FqTtQ0ROs
         pMzla42cpi1FNEKPJ9MzBc9xSTm1ay5J8+ZJrlQyQmgclzfthu5ClafSzRZEQ2IaD8J0
         hxDXgJdNmrzxORHr2U4KYB0QzakSmhaIu8Jv+PbEOpMVKjTepSM0y6NLnqrSPFvQWoSc
         su6WGlcmG28la08WzqkbwHXea3htNo7xqKMbluhMVWLk1Vu2v2lP2MFEXaQ2bC+mk/Yj
         X0ejA/gcH461W5Q2Xd7+BessAZX+frl3/D3DYZEq+HDhJEAcAzovXC1S0rhJjRbpi+YA
         yXKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795107862; x=1795712662;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tbGvL9tZ+BYgVAO5FMDS+XSwp11ngMpDyW2424LSejU=;
        b=PwasrkUXy7RBrP85FsfZwxtSpmxL7EVC9bZ3eRXQRpC9J9qOSDaaJnm3NwaC2E72+4
         lvGqIjDj36MgGnFf6tQtHRAQir3e0g8NL53HhEPS7Dto67n4TSZCtUuhEV9oWvb6tZer
         68gl+n1vD3PiRCXQ4yu9oUvB6uqU+HR3XyPsUq1yZTlh9jY80DLJDBw3EYWPZa4JsgcJ
         elfslkh8ANndNsWZSxH4vB0jDov2j1sAYmeUgNCynn0bgpUUa+XtJPW9f2PqwtVXW08Y
         GLMGmlQDlY7k5k4Z1gtlfxA56l1LgtHyd/RKgUAHsUi2TKzGgBPfz7bZ8+fWw9pWYhMa
         nofg==
X-Forwarded-Encrypted: i=1; AL+hErEn0BPZZxdJngQiGjL+QkZTGuOTZBZoA3j1Xy07ajbcwZrRiDB0aCfgre/TkVUZvPjFGIjB7Tl5pJ4DtNM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8syNoXPcw2dJvkXr62pHReTIEZ12jKZH5GYmsVu4cUttWtqX58
	4JQ3ojf7gTeccfPfC1XTwrjsWLZyfj0iyVn43wN6YogvjMa9pgo3yjuKP4gDj7VHoAZnA2moESn
	hSHpQ2tHpmg==
X-Received: from dlev7.prod.google.com ([2002:a05:701b:4647:b0:1b5:330f:621d])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:701b:4584:b0:1ac:9da7:e86e
 with SMTP id a92af1059eb24-1b556908c17mr230062c88.30.1795107861814; Thu, 19
 Nov 2026 09:04:21 -0800 (PST)
Date: Thu, 19 Nov 2026 09:04:18 -0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.1.708.g77570a6a1d-goog
Message-ID: <20261119170418.1511770-1-irogers@google.com>
Subject: [PATCH] HID: lenovo-go: Fix reset_tx_dongle sysfs attribute to be write-only
From: Ian Rogers <irogers@google.com>
To: "Derek J. Clark" <derekjohn.clark@gmail.com>, Mark Pearson <mpearson-lenovo@squebb.ca>, 
	Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, Elkin Cruz <elkin@google.com>, Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

reset_tx_dongle is defined with LEGO_DEVICE_ATTR_RO(), whereas all other
FEATURE_RESET_GAMEPAD attributes in hid-lenovo-go.c (reset_mcu,
reset_left, and reset_right) use LEGO_DEVICE_ATTR_WO().

Because feature_status_show() has no case for FEATURE_RESET_GAMEPAD
(which is only handled in feature_status_store()), exposing tx_dongle's
reset attribute as read-only makes reading it always fail with -EINVAL
while preventing userspace from writing to it to reset the TX dongle.

Change reset_tx_dongle to LEGO_DEVICE_ATTR_WO().

Found by enabling Clang's -Wswitch-enum on an x86_64 allyesconfig build,
with AI coding assistant help to audit the warning and prepare the fix.
Build-tested with Clang; not runtime-tested on Lenovo Legion Go hardware.

Fixes: 82cd9bc866e1 ("HID: hid-lenovo-go: Add Feature Status Attributes")
Signed-off-by: Ian Rogers <irogers@google.com>
---
 drivers/hid/hid-lenovo-go.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hid/hid-lenovo-go.c b/drivers/hid/hid-lenovo-go.c
index 318b1152ff8b..8a2aa2b4825d 100644
--- a/drivers/hid/hid-lenovo-go.c
+++ b/drivers/hid/hid-lenovo-go.c
@@ -1848,7 +1848,7 @@ static struct go_cfg_attr version_gen_tx_dongle = { HARDWARE_GENERATION };
 LEGO_DEVICE_ATTR_RO(version_gen_tx_dongle, "hardware_generation", TX_DONGLE, version);
 
 static struct go_cfg_attr reset_tx_dongle = { FEATURE_RESET_GAMEPAD };
-LEGO_DEVICE_ATTR_RO(reset_tx_dongle, "reset", TX_DONGLE, feature_status);
+LEGO_DEVICE_ATTR_WO(reset_tx_dongle, "reset", TX_DONGLE, feature_status);
 
 static struct attribute *tx_dongle_attrs[] = {
 	&dev_attr_reset_tx_dongle.attr,
-- 
2.56.1.708.g77570a6a1d-goog

