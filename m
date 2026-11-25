Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795645089;
	b=j9+Ft+nQQpPIf4714mtTwywHEMejJBbUaI+m1pMGtGBGeiRENUmKHZ5ysT0VEDltyFU3
	 n2uIfci2YtmlShHMAwk/g1//a5076eGk2BfgpOAcvI9Ani4PrkOdPc6+LLNt46351hlSu
	 ptxgQIzUlxYeGQTvQK/5vtj0MUz6nzJ5xg973ScbplY66wjj+Vc81UqpbbAEn7eejw6SC
	 cRtB3Zd1ik8tXwywJVYcXN0qgwHakk0Wns6oTFtRYkzBck2RFdQ0/VJ/Kjy0w9Bxaihfi
	 dE0tu5GXGox8exUqe0kPtk1CpRkpBirGrB+cj7rA2V6ODGKDgzZ5G/IC2A8EjlhfYKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795645089;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=kKJiwYR+cu5mrPZf9A39ckCZmDdoMlP8HFoXJiTcA30=;
	b=UhhPtGfEy/x6DoNRwgcIwiGUnOCxkzc5nCCenwcOUhAsr6PyiDzrtvclMuqdG7Ju8SiJ
	 9kX81j0qP4rud28sJMukthK7nRN79Y0DDpZr9kHJrbZYGGy1rROyqraIsVTP8GpziAB2H
	 wES/mYgTnsYbVDByPTCcfFyL4V+CJev7GejAVsLstkTAb8orsOjZiADOZDj50kqQVFo+T
	 E1W2Q8/t8ccik4xde564JvTuimMsctOas2bXuAsFAW0BB1umHHYYQdpOENQsGQXK3bZth
	 FQ+cEzR3ym6oi7cwbj860rr7qIUC5WbfHkn8jABDOigaU4GTCXVKGU7Dj3KfxT8czEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZVY8mCqs;
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C772606A33A
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 22:18:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9C772606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZVY8mCqs
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-38692f62b22so7636926eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 14:18:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795645088; x=1796249888; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kKJiwYR+cu5mrPZf9A39ckCZmDdoMlP8HFoXJiTcA30=;
        b=ZVY8mCqsBddZObOYIXIcss49XEgjhI0oEJgatBFM7cmxjhdOEXS0El9GvbTlT0WULY
         9i2iWLH1dX0WdE5V15u8Y4JibImKiTs2g5oByUP+osAHP7L/fWW+xEOrLbgycTHKuGYN
         FxCzpaN8287ZRGpFtnYy51KJ7IiSKqSMTab4JYPsyAQIjBNj3BJTCIYvSWKmN1OtGz0f
         GMaPnJELkgByGFo2IQNiPGsRHGwMAE22xqRkfijG4eMPE4GTi0lu/k4RzAqDjxeYPS98
         +TvkzDW9yo0zD66xDNH3QS9yE1fDmz6W/TAlYCxHkAkDWzR9Z96Cv+Y6AIwSODhHt6+/
         G00w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795645088; x=1796249888;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kKJiwYR+cu5mrPZf9A39ckCZmDdoMlP8HFoXJiTcA30=;
        b=agBj1nxZloH2Hsbx3iCO05Fn7l3r8gmDZMY4Uw3/9kFkPt7tne571YG/r4eAh+YmoE
         dmOWNQv3A8hnzE4d9zssN0HH3nlAORlv534ReTqgE1jmhum4RRAuX+Lb1c21DVBhHAhR
         whf3nM4UNbvgL+y9IfSOVI8NWfnyn4hzRXOR1XcZ71nokZcXDKpQ3/y6Qf+DEQ/RwBF1
         IS5EuzIk+/E7AwpyqfKMcJEYkaO9AbMPbuLKzE1vmxf+CiwNYlL0KuUWVxYMzHODiYyu
         Jcf8Ab3Pi512NinEn3Yt0fxq6Gi9OJF138ZQdekb1XjXi3xIgXWppB4WeVhO5nOtVj+a
         VsYQ==
X-Forwarded-Encrypted: i=1; AL+hErHtu0i+9plExt+qDA1H3jjACqqGtPuyugCmIwSo7HbBmaJZ7hB1hmgSG+Z9X7IeBpUQL8e96UZGelnHjwY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/T69r7jcJYGLOE0Qo6/UhLK+UIbhDkqE/BCgsOTDt4STty0Ock
	GEB0KJGU4CGxfzvmG8U3EQ9ixqTUEA8ePrpn3DErXM6Gp74sDGZQe+/q
X-Gm-Gg: AZFdTZd/NIeGeuDJrGuL+965OKJrt8SCP9rZZ9apnqJ/liyfgGRJA07UooXeQxwCTuG
	oJUisG3C9VZ7MkqutqoEIQqn4LOR6sCSUOHyohSN7s7bsX4sFGqfwsp+NRoT+PzZr5A2YMFLKUH
	4JMpyMlNQyi4moDQjwaLjLtYVtPpBBN7hnmto5fitMgZJp9LfaR8Se0ffyF6vUAzk5DfDCZvkyd
	AMSOhMxnSO/5IhGtnDzzT/hMOHK2lOQfr7V3duFt2K++ivtpz3M4EEFZjx2qEbe42opJXkaygq4
	1iBFSq50TqPcmoR7hHFdgQuRjbbdEAvdVvTxdyumVO40lXhAq225K/b2VGDSupUZTsK9I9JVKHu
	NohPunqNUvieAQ9aYW8xkk80EoCjCMwCZ0POg4RedR2wAMq3PR9S4h0APlAXbgYEx85CTTWqV+8
	7nEnDfwPKqo0S8W9OvuCpFiTNEwLU5/Hmb2JoSJEe6ZGXG4dT/vkIWQ4e5+eghBdWeD2QxdpEEx
	6j9ZU+Qgi9cqS0PIbprV+ULVRPZPJ5bJmIn6GfP1XDdK3mh9m82gwtUui7LM9fe8BAprb/TZTdm
	i0i987osIJplIXNQXuDv
X-Received: by 2002:a05:7301:3a82:b0:374:ea35:9069 with SMTP id 5a478bee46e88-3856fb67380mr18010876eec.39.1795645087464;
        Wed, 25 Nov 2026 14:18:07 -0800 (PST)
Received: from a1-free ([2603:c021:8021:f000:0:1865:8c38:18fc])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e99fdsm69581357eec.5.2026.11.25.14.18.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 14:18:06 -0800 (PST)
From: TAKANO Mitsuhiro <takano32@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org
Cc: Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	linux-input@vger.kernel.org,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Vadim Pasternak <vadimp@nvidia.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	TAKANO Mitsuhiro <takano32@gmail.com>
Subject: [PATCH v2 2/3] docs: ABI: hid-lenovo-go: Point one entry at the top-level attribute
Date: Wed, 25 Nov 2026 22:17:57 +0000
Message-ID: <20261125221758.2535044-3-takano32@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261125221758.2535044-1-takano32@gmail.com>
References: <20261125221758.2535044-1-takano32@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The protocol_version entry at line 389 describes the internal MCU, but
its path carries a right_handle/ prefix, which is the group the
removable right controller lives in.  The entry at line 566 already
uses right_handle/protocol_version for that controller's own attribute,
so two entries claim the same file and abi_parser reports the symbol as
repeated.

The internal MCU attribute is not under a group directory.
LEGO_DEVICE_ATTR_RO() takes its fourth argument as the prefix of the
_show() callback, not as a sysfs group name, and mcu_attr_group has no
.name:

  LEGO_DEVICE_ATTR_RO(version_protocol_mcu, "protocol_version",
                      USB_MCU, version);

  static struct attribute *mcu_attrs[] = {
          ...
          &dev_attr_version_product_mcu.attr,
          &dev_attr_version_protocol_mcu.attr,
          NULL,
  };

  static const struct attribute_group mcu_attr_group = {
          .attrs = mcu_attrs,
  };

So the attribute appears directly under the HID device, beside
product_version, and the path loses the prefix.

Signed-off-by: TAKANO Mitsuhiro <takano32@gmail.com>
---
Changes in v2:
- The documents are fixed before the checker is added, so the tree
  does not gain warnings in the middle of the series.
- The internal MCU protocol_version entry points at the top-level
  attribute; v1 gave it the prefix of the removable controller's
  group, which made it name the same file as that entry.
- The checker keeps its warning for an entry without a file, counts
  lines rather than occurrences, and drops an unused loop key.

 Documentation/ABI/testing/sysfs-driver-hid-lenovo-go | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/ABI/testing/sysfs-driver-hid-lenovo-go b/Documentation/ABI/testing/sysfs-driver-hid-lenovo-go
index c8221373ef76..6ba874913c1e 100644
--- a/Documentation/ABI/testing/sysfs-driver-hid-lenovo-go
+++ b/Documentation/ABI/testing/sysfs-driver-hid-lenovo-go
@@ -386,7 +386,7 @@ Description:	This displays the product version of the internal MCU.
 
 		Applies to Lenovo Legion Go and Go 2 line of handheld devices.
 
-What:		/sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/right_handle/protocol_version
+What:		/sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/protocol_version
 Date:		April 2026
 Contact:	linux-input@vger.kernel.org
 Description:	This displays the protocol version of the internal MCU.
-- 
2.53.0

