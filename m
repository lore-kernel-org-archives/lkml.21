Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795032338;
	b=hacC3ZPxdSdcqTL+QUwJvXSwdwxRjTpZimYVt4L6x6appNwhiwXEh0ViyW+nYP4aBhNu
	 DSaEfOiVPD1eSruPSr+NMS793gnUFUjzozwFBwi3ZLonXzGeo1Lu/SzDrzR4pplnoJL1K
	 0K7ylX9G3GScHIg8TjtWgGHdCZ6kz+fVaC57423dUAAmSO1v4Mu78RNl0xyXYDtNJ1q2U
	 FzCTPwp1CUU5fg88zor7MsZI7PiuokxBFgPg2lGEmRIBSF1WWiGdv6LXuvLv7rQmJFLpM
	 mokl2V4b0Hapd10U1F4uJghD6hw73HxpBzein30RiSVLZnj3b8HWmU71Zo6tHjPq6Hg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795032338;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=sT8BXmWr3ZtRZWaM79NQqvkyqTyjCTuzoolorXg8m8g=;
	b=gBejf7UASSyVcWQekJdyOVgK9w/mLacDHzCM9cj+Jwg+4s0Owu51Z6AcDb6pvzI4HuMK
	 IaQ8/j7naIT10UJg8iYhYvD+HFEPCxLiv9SnvrjUzDPgcISEoISiBlrrg33LsKGXgd1BW
	 R8hXZDBFM0GaUUH22cQcFG8sYatCdE7Yn/R7FD3IukQ4BZI22iqczHQd+1tZOFO4LF9Xi
	 7fs7E1nj3bTttyrLg6Zgo57gaHQ1I3iPdCFi9mnJcMa1FGJv+HnMk1bkJSyUXaFzZrrHJ
	 BnR4AXY42atO0CHrQCCR3bdlpAj56fE0R2MGS/Uxkrjttq1PqC9OvNrbIg/hPbiWvzQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="XlcqI/WD";
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCA6660A2623
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 20:05:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CCA6660A2623
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XlcqI/WD
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-38190551625so2533621eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 12:05:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795032337; x=1795637137; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sT8BXmWr3ZtRZWaM79NQqvkyqTyjCTuzoolorXg8m8g=;
        b=XlcqI/WDSL40sFhRfuRWgVgFbUDcqd4dc89nkRX5hq+S6M8QdNcniDdhvF5vb59JR9
         +24b2dBI34OdoIn/aYyBvSwB9tz2lynON+qJxamsUAXHpVmYD/3ZKBFhNp3ecyO+jlfH
         yLH7pY8+TH7FTvuT5+ik8N0FN9+di52g35SX1/oNpSBHggxVrH/KYVnpZPxnnGG7tPAK
         ijRQX/dWp/4oznE3o52u/IE1GSe+QjU5+euXF7w4YEyxGh1/eE5NSDL7B9b1dtmhE3RB
         XHUDBQWdTuTfQpILYYqp1x29wahndXSFG4yJo9XWSRArReOv4M9bjUoseDYx8yWpnopP
         7jSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795032337; x=1795637137;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sT8BXmWr3ZtRZWaM79NQqvkyqTyjCTuzoolorXg8m8g=;
        b=IfD1Ppyrvvj8kGgEHerToWra6AUEpVJN4vFyWknQDTJjNrABLqQKQ0ZkHVtHsO+qEC
         hTSKh146ugXom0Wsc+wiQqv3dlBitA+g+4Tl90lykb+KSE9YLYjq6xQjXNvL/Ow/jK3h
         LE34P586jLCuPvHXIvoxz4pL/nU0Yxytlji8hDXLvoK2o7VM5xAWARhV1shxPgmy3Scd
         mgsLI2oDMvRrde/2Hu2VtC/zStl7CsswBXzc/bVvmHMMcl9J7HdWCuR8s3rb9XP/e1d8
         C3yEzzWyIaup21nF1mzGEvWkVHBqk6jinLV2791/EpJ0gRo3UPYRFlBym+cbExhxW1u/
         5tKw==
X-Forwarded-Encrypted: i=1; AL+hErHHrcUiyXcuO6AWZtfSxTKszYnJ0LZYnxjrEWBoPmYIUSf31MqW78MEEpisf1VukmNvqKanbI+zUxNzFJ0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/nrssdzoP+jf6xfhmi0p8a5YvI5qzUQ5+P9/V/WAdfAgfPjXPU
	KHGHQ3x4PxEg88fP8nU3QREwiF30ihL+bOXrDVzua4VdTymt8rEK+5Mm
X-Gm-Gg: AZFdTZdEEu52xHrr8S0X1Y2xokqRpGqowh48P/OLgf6A2heBLxbmETDXnQppZWnhrB2
	uGFpcuv2eWqeKyxqhViA33e1VpKQlndVXExj2EVt5di/ruZ1eawoE8FzxXeQHyPyZOO+MKF3MJd
	ZFwWfgM4NzBB/LG5DSoG+lLA7Sedm/3yas7zBjcmOyaXxmzjtzRYhcrOMu85qMdLCoi25SRC/GO
	Vl0hkddgRISdlXk/MZPYDhrk59slUTQju2grQOOPgJTL+9yEmvk43xpq6vQVcV+IXx/5Csqjnrh
	dPJP/I4941DMaDpd/u8XlDvMwHXZ5xPgQgrTFU4UTCySHc3pSsg2X3alsu3gqYcwwU6q6VwZ9EU
	H+nGCq+APWY4HSc8zH91BDpf9uKVoIjgA6BwghEiQyxyBKGhZzRhfTO790BbMdZOBII2ydITONG
	lRK4LqZKAVJgL769BZgIeZcCYDC2iWSYvH6NkfFKTX8G/3kT+Y94nVs3YVaNsJVhCfRdqBbQFZ+
	JkETTh+R2G+wagj4+w11sk1i8kMnAJqWTKvFYGq1nBahRgFCurOSBc6qsBLNlDitf5CxgSjdJ9p
	AxpnpP+4ejF+QR1aEH/rbSQ+ig/ujrFoh4esw4B92PCLhOjzIMViK3kqQ7f/dJjB5syeO1yb5Ke
	r4koIAJzKjiLc593Mwg+RuufHLmIu
X-Received: by 2002:a05:693c:83d4:10b0:36a:5126:a8aa with SMTP id 5a478bee46e88-38281025978mr3395503eec.27.1795032336889;
        Wed, 18 Nov 2026 12:05:36 -0800 (PST)
Received: from Mac.localdomain ([12.162.234.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a72eb2f3sm11752204eec.18.2026.11.18.12.05.35
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 18 Nov 2026 12:05:36 -0800 (PST)
From: Ahmad Byagowi <ahmadexp@gmail.com>
To: netdev-bot+sashiko@kernel.org
Cc: andi.shyti@kernel.org,
	andrew+netdev@lunn.ch,
	corbet@lwn.net,
	davem@davemloft.net,
	edumazet@kernel.org,
	horms@kernel.org,
	jiri@resnulli.us,
	kuba@kernel.org,
	linux-doc@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	pabeni@redhat.com,
	rdunlap@infradead.org,
	richardcochran@gmail.com,
	skhan@linuxfoundation.org,
	vadim.fedorenko@linux.dev
Subject: Re: [PATCH net-next v3 3/3] ptp: ocp: support the WiWi revision 02 Time Card
Date: Wed, 18 Nov 2026 12:05:34 -0800
Message-ID: <20261118-timecard-common-301f823ddd-r3-ahmadexp@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <179502617840.3136.12704245716223038161@kernel.org>
References: <20261116-wiwi-v3-87afa10a8-3-ahmadexp@gmail.com> <179502617840.3136.12704245716223038161@kernel.org>
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

Thanks. I have prepared separate common-driver fixes and a WiWi v4 draft.

The common fixes use tbl[i].value for all boards, mask SMA_ENABLE on
frequency readback, report disabled inputs through the None/0 Hz entry,
and correct the common DCF output frequency to 77500 Hz. The selector,
disabled-input and frequency fixes carry Fixes: 09eeb3aecc6c.

The WiWi table also uses 77500 Hz. Its new init replaces unsupported
output selections, including GNSS2, with the connector's default output.
It leaves valid outputs, inputs, directions and neighboring mux fields
alone. The normal sysfs read therefore names a supported signal. If an
unsupported output value appears later outside the driver, the read
returns -EIO; the ABI document describes this instead of adding the
unwritable "unavailable" token.

The removal concern is real at the source level. An EXTTS request can
rearm a channel after detach disables it but before the POSIX clock is
revoked, without assigning a PTP_PF_EXTTS pin. Clearing readiness alone
does not serialize an enable that has already passed the check.

The separate teardown fix uses a mutex shared by timestamp enable and
disable. Detach sets a permanent stopping flag under that mutex, then
disables and synchronizes all timestamp IRQs before unregistering the
clock. New enables return -ENODEV; an enable already in progress must
finish before stopping is published. Disables remain available to the
PTP core. The IRQ handler does not acquire the mutex. This is a common
fix with Fixes: 627366c51145, not a WiWi-only gate change.

A source-derived pthread/MMIO harness reproduces the rearm window with
the old code. The revised code passes late-enable, in-flight-enable and
active-IRQ-drain cases for timestamps and combined PPS/EXTTS requests.
The tests run under ASan/UBSan; DPLL and routing tests also pass, including
negative controls. Both driver objects compile with W=1 and -Werror.
These are software tests with stubbed I/O, not an in-kernel UAF or a
physical removal test. The card is currently reserved for Windows HLK.

I have sent the four common fixes to net as a separate series:
https://lore.kernel.org/r/20261118-timecard-common-301f823ddd-0-ahmadexp@gmail.com

WiWi v4 remains unsent. I will rebase it after the fixes reach
net-next, so the feature series will not duplicate them.

pw-bot: changes-requested
