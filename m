Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795648891;
	b=ykB8eYbbLQQuwRaA3Gxvk6EoFGKYagQAM3pAFGYRhRS2lOgRmtjQP7pxbraKjybEdmBY
	 KSuyTv7eM19+rnUqjBhsC5jx5wdgDk4xgewdRYU6HpjhxWB5x8yvsP8Sci0DBC2WQYuLC
	 jnaNvBxuRLYCuWC4gZ/dBlv2Dz2I+NUX+WIyTusZGK1YZbeNn3eRWkhFXLuAMoDSpvFqF
	 p0Z/YYHQeG9z6sdMC5fsHm+emAGgCWKzFccvaJo+jmV2mwnaVdz8tGvHvCb8Wh+RHLdXU
	 QtaU2hxY5B2Pv/EUVVO/1cbKI0XjSt9g+kfFsV8RkcM0vmkXjE7LfX+vXgLRAnLNgxw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795648891;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ieM/zGjAJfO25gu9xPPDqiP6cWuU8YtOHXUXjTS+m5g=;
	b=4q0MU773vsUroQ9maLRo6blfm7Twz82pe6gGKAQ6/eOBqHv8A0ItYuaWDpffRxlZTL78
	 Q0sWIh710RGWDkJhHIIrXpWltYQBl5n2biRM5DHP/JQIG6P22MKKu+EtlaAaAm7JyvIdd
	 74a8zHMtg98mOL37l0j4CZGIiTNpLRRUFekWs9wjuNpwBJbJCyQi9N4bP9XAM9j3pqMtH
	 3ZVJ6XQXH9uiiHLcW7RNtB9oESExziERqSRJHC6a8F1wGDnx9krjAbMWCYZJHg8iIzFaL
	 J4NYbN8WW5UqE1UlsINWV2FY2pn+Vuw7YdPx/OFbvUoHoROLuOAtHuWF0oqr3eft7Mw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SFwHknwy;
	arc=none smtp.remote-ip=209.85.210.173
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22A78606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 23:21:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 22A78606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SFwHknwy
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-8ca6a12efd9so2175669b3a.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 15:21:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795648890; x=1796253690; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ieM/zGjAJfO25gu9xPPDqiP6cWuU8YtOHXUXjTS+m5g=;
        b=SFwHknwy2mjAC0b91bU6teeBekkRM8TT4E/yFlRKc2+bdwfpCgI+zxVOtchjaFS+o2
         WOTAc8+ihaQVD3/egNc5atu5Jz/7zGUUl57DY8TZe3bQAd7Hs12jRhp3EGmH3++KYlB4
         wEc2PgfxtZQbwX/Blvm0nN/YHH5m/dy+P3Ir61+l9FX985ouxxxVAV4c+Njd+xL38xSt
         0l1bMwSr4gqJqqtlhUoeEoN3pzzoMax7XZvS7fm5yOthLhM3+0n3OEP72pyJMupb1wwn
         9AAbAfRUw9RrhmB1Wc95FcJ8AL5vL9AHy3m0Tadu6GmDEI4lcjpknIidVRIN3iO6zP60
         A+Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795648890; x=1796253690;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ieM/zGjAJfO25gu9xPPDqiP6cWuU8YtOHXUXjTS+m5g=;
        b=qfdFqpYB7Uv5RFfO7AnTUTILDnOAVuGOW7AgObGD3Lbf+9tNzPZcsxmr9TJ/MctcOe
         7AzJw8wxXmnvsdA6EgW9sLA1486ircYSmxBScNbqbgCvs0o5Hfes0lN6Zmur64gxeTv0
         mHcNIHjxTrFKVC2UPZxHqTu4hcQ5Sl7oEaaiXPwd+aQ9bq9JwwmAHiPryh2qbpFrgO+m
         9WwRz0q8RRs4Q133JyGFnwwraeAD1c3m9szB7n4GOo3P9SwF+aBUBdrUO04vl0QknyV6
         PAZ3+6FWWKv7XHzjU2zNvDFiZP45CzN2/12/JD3prUYRVZYlgnurqdIrmNT14KME5q++
         uEWw==
X-Forwarded-Encrypted: i=1; AL+hErGZTfcNrB/2Fs9ZVG+TsgmpbR+VkWLEp+btFdDdGI5pYNQMaNBy3EzYEwoUPcmbkVPhddVSTIwmft5ubqU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Rwldl8YFUmvu2qezX3VmdgwaOjaVk37Ofx3ZZbcwXsdE/+HpV
	Di5RSgurv0RLtyIyhopXjFFXjU5PX+cXsYxsZ/Vldvs62QjwtKA6RVpo
X-Gm-Gg: AZFdTZdLN+hfOn9R6xhgC4PWeXgzggm09YdQmmnX5nI0+Tq8vSk5449OTZ3xHI+2JWz
	7tQPnVhyvjGLEUUzK/zNZ1Xrx0B4Vn+cRdh2E7c8dgxyq4LuEFUqGIanXk/ckMQ+HGBRPMEZdW0
	ZsutKZMsADGwHNIt4hNoT+KeeI34D5/EpdUA1JE2xC23+/Dwf1Y+xuxArkh0wOdEXrXRiYvkDWa
	zEdI07LXGz54h2xovPkEmAScStG3JSiEGDGWShgYMeTHpLEmtdfwfBcxrPRFY69ksN0TbM/ejw8
	vRKVOunz3J14CqDzFt14+8CXDl9a0rmK6Unh60VOFBOzkqTn8h1LACXnXgWggF6NRfMj+YhOgKB
	4lI9KPmB7RP4jMILutGBkaZSIUKBR4fN3D+hqOzixecbVXsMkXZ0Qko9yDlIXpjVm8cQMGxxoEf
	dh0dDVak3CcihFi85lSDjLZlIH+9iYNYcXaxxFHohd3fp9Vg7yxUH05GHmmTtkpXSDcqIXByQGI
	6FcJUJ71NYj+wKhEtqibDX8gSwOckQG/HlUecWzH3Ttv5KTj7ux+1s/O8rQy+x8q9NPF3sHglfx
	wAvB6xNCuf6GOMzV8fTfC00Na1X18wooL1AKLZTuIh2gwYuSTy0d89n4xpjaumI7+5Cfo6nVNme
	ndg5hOvdzsJUGX3WvGzwzS4sprT8p8Lr3WkNNekJ75ENew235ZoBU783bTB2GmSbsAIerGkvUG6
	oTcw==
X-Received: by 2002:a05:6a00:a908:b0:886:773d:a6a with SMTP id d2e1a72fcca58-8c87c199463mr16356756b3a.28.1795648890326;
        Wed, 25 Nov 2026 15:21:30 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c873b25bfasm9864471b3a.46.2026.11.25.15.21.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 15:21:29 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: Matthew Garrett <mjg59@srcf.ucam.org>,
	=?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Darren Hart <dvhart@linux.intel.com>,
	Gabriele Mazzotta <gabriele.mzt@gmail.com>
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/3] platform/x86: dell-laptop: Fix keyboard backlight and charge threshold handling
Date: Wed, 25 Nov 2026 15:21:06 -0800
Message-ID: <cover.1795648586.git.rosenp@gmail.com>
X-Mailer: git-send-email 2.56.1
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

Three fixes for dell-laptop: keyboard backlight timeouts that overflow
during unit conversion were silently accepted, an unread keyboard state
was used at init when the SMBIOS call failed, and the charge end
threshold was parsed with kstrtouint() into an int.

These patches were developed with the help of an AI coding assistant
(Claude Opus 5.5): it reviewed the drivers, found the issues and drafted
the fixes and changelogs. I reviewed every change and I am responsible
for them.

All patches build cleanly with W=1.

Tested on a Dell Precision M4800 running v7.2.15, using the equivalent
backports built as out-of-tree modules:
 - writing 4424214d / 18989323d to stop_timeout set 4m / 2m before
   patch 1 and is rejected with -EINVAL after it; 5m still works
   (v1 of patch 1; v2 is compile-tested only)
 - charge_control_end_threshold rejects -1 and 101, accepts 85
   (v1 and v2 of patch 3; v3 is compile-tested only)
The kbd_get_state() failure path of patch 2 was not triggered.

Changes in v3:
 - patch 3: make end unsigned int and drop the dead "< 0" check
   instead of switching to kstrtoint(); retitled (review feedback)
v2: https://lore.kernel.org/r/cover.1795219225.git.rosenp@gmail.com

Changes in v2:
 - patch 1: convert to a u64 seconds value instead of failing
   check_mul_overflow() on the int, so the unit selection below works
   on the full value; retitled (review feedback)
 - patch 2: don't fail kbd_init_info() when kbd_get_state() fails;
   fall back to level 0 / off mode so the existing code picks sane
   defaults (review feedback)
v1: https://lore.kernel.org/r/cover.1794633179.git.rosenp@gmail.com


Rosen Penev (3):
  platform/x86: dell-laptop: Fix keyboard backlight timeout overflow
  platform/x86: dell-laptop: Don't use an unread keyboard state at init
  platform/x86: dell-laptop: Make the charge end threshold unsigned

 drivers/platform/x86/dell/dell-laptop.c | 50 +++++++++++++++----------
 1 file changed, 31 insertions(+), 19 deletions(-)

-- 
2.56.1

