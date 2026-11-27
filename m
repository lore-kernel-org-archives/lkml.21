Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795779590;
	b=HQTkG2nQ1pVYqcwnWoTRr42cjzeIANcLJmYvY2cZVJKf1zA4ZcXjhNIuYFo1BwnZIDtK
	 JgVDHS3IGxAvzrif0z393lpXN3I0bfjAV7xf+I72jmOaIY+yQDnvJAHMYBJ4U+W3g0Bah
	 WQEUqpd4VTIE1XPA9S3/A/s+GyreG2jd6cNsezsyeOeI5oNs2JmNT54rb4Hlh6C4Zm1se
	 q1GvrMLWBQYqtxYre2WVkWoQV+q21sxgvViCf37/AHlMnDvvbmHxRAA/J49+f+B0bbVBB
	 ZAGNAAqBS8Y0ZEVkEIPwOIGsZ/v7rPAXOFYtawbnuhyevqqptZeP6Uxhmcz5evfNtsA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795779590;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding;
	bh=YwGjvP6ctTxZun8XTu6GbbqiRyztei0tj/DC1LKv/lo=;
	b=ZeG4908rcZbqlMO+DbfgKG1+2bwvxwcewlXz6dB1NDdA1KBW9Si+uS3DyZerzu/YbL0M
	 WPcMnCjwhK0H++Z7IdpVQZDf6h4nDGXmIXIq5Qr9yH1cY1TwfWDwRy+3V1RbVeJNR3ken
	 NBXyGezMu0QUwgH9JmW/WfQzS1XaWMY1wa269u/O0+18J6KMWwqJtVpVauSkaGYzIh/5Y
	 gtE0VYfFalNPYV9oLDCh+iyYnWTJHzpIYRugeffOWYarTD70EaI/M/hIpaMoSqpYcmomk
	 pnlN/xLRm9a9j2TbXwdbYblhGqDIgug8tSe80Vt0yTCtLxr8TUdE/BnO5wTvOEy/qbg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QQ7acz4x;
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DBF3606A31F
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 11:39:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9DBF3606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QQ7acz4x
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-498f5fa5103so4754283f8f.2
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 03:39:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795779588; x=1796384388; darn=vger.kernel.org;
        h=content-transfer-encoding:content-disposition:content-type
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=YwGjvP6ctTxZun8XTu6GbbqiRyztei0tj/DC1LKv/lo=;
        b=QQ7acz4xlhD3RYLzomhJm165MLMJRjrcJfaTP1hC7GEuhv7Pl0QDXSRfBa+sSY4IhP
         xyOvTvytUxb35HqQoOcP1+CNe8ZHmENXsBnlFwDKezoK/X88d1dhFIC4ehx+ZMBqr8hF
         O+/PYmYYjPLIcOaLmTc7RXfGLEzZC7XQs7qiWGTLZHWydyD6SQTXIR+opISl65zupccL
         AbCn9LfLWpJn5xqjafq8RMsnvLsNOv29K1WgZj56A1qHuY9CkeF9neQU6QbLLmDp8cQ3
         tRZDl6jXH+dBbyxw7KGO87eG/V/VegWsgA6YWFG2muMVehGlCjdGntKXlA3J7+o/dTnY
         WTRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795779588; x=1796384388;
        h=content-transfer-encoding:content-disposition:content-type
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=YwGjvP6ctTxZun8XTu6GbbqiRyztei0tj/DC1LKv/lo=;
        b=wW8DFWW7tljOy2xD9KAxY4SBPv1Cqt9UMjW/t2BDF+uwRPPkp+5XU73H+VJ67RY9YS
         cOAHAOFZMp8OXuayPhFUli9MKxiUXWi7SSeW+IErYEAhpejurPjVtqrRy4RZl7RdRuZi
         +AJ3QGmfYwVJa2ipQmMDLeO+oWaUESYzRaD269vH64tCvxNG5/+Gi0wh74ZSToH8gbvm
         bQvcj/xtayqMgIufhRlC/fzo4xv5ExjRTX0Bveg7etJ9OyvWYb+I9d9M03Jc+Ov2GR/p
         V3ttG9ctO0XCYcemjNY8J+cQaMe1yVtwZkkl93s4/YTK0uIQG6KKWFhgiKOy3kOr/+ER
         ql5A==
X-Forwarded-Encrypted: i=1; AL+hErFf4SpuBj0s5D7fz8H91gVLVj1wJtDNYlXxBMCeGmd01chAHrKNoFk8yb5zoxV9H6Ceyn0y2FIgqNktIVI=@vger.kernel.org
X-Gm-Message-State: APuU4Z9jxIU9fDe6Y+5150uGHf4HpJN7Nn2y1wLbZYqjEtPA2eRZ8x27
	M4dVcVXpeyP6f/FoENVjxX9kPa93dk3a4GX/Amv/CJyaTFSMprNzXVKZ
X-Gm-Gg: AZFdTZe5vCAKUVfzqyv7cV1cpspL/4YAHJtk59deBYUmkUxGp8O+aJ1Z8EpJ7DzO7in
	ricGOGyVs9sSFSZkC7tS4veJS4NYWcDE603xpdp6jDhc3ntBlNlg3vvmlfi/mlVRKLgQgjv1QmX
	RztAcQWNRYCw+BKrRE/F5kdXkc3XQLjwyS2js0hFH8XwYLmc/MM0X3GzECzJ86n7kRTFBbVEzSk
	x4Aiq99FgnR6IcMFDvRVgEQLSEzoWx3SXMzGnmG/w7qm/FEpcvHh1ZOeGiEtwBGLU0T86hw7M3s
	a7tUXRLxZgi3kg8XqUl5Tg7DeEEsNXZ+oZRESpQi6uauxM4sTJKqS2eRIJyiooaD6K27hn9jbmy
	gbEVgK2RTGeATExtXSwYVXsZ779ysdqUtqktzFhIVGHhEblC32Z8kJzaRg+YSBFm0ExzcVsEFJ+
	LT108uuftXgKXuun/bOn/JH+idjQUa/BrSPywlE0hmPPU5ax/8RYYbz3HvNrbcuRAwL6jxcpOkx
	XEzfLnW2js8wJ68gxQ7u2hm5JMZfys5jW0h+KS+Z4KlAMT1qo0YVux4ANaToQvqQbcQXV91jAbT
	JhST394AnUJVub261/FVT5YnpEVW3cU=
X-Received: by 2002:a05:6000:184d:b0:48c:7386:af18 with SMTP id ffacd0b85a97d-4abacfea55cmr51711565f8f.8.1795779587982;
        Fri, 27 Nov 2026 03:39:47 -0800 (PST)
Received: from ArchOarora ([95.179.249.152])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4b34e9c3ffesm31135419f8f.19.2026.11.27.03.39.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 03:39:47 -0800 (PST)
From: Oarora Etimis <oaroraetimis@gmail.com>
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Melissa Wen <melissa.srw@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	jose.exposito89@gmail.com,
	Jonathan Corbet <corbet@lwn.net>,
	Harry Wentland <harry.wentland@amd.com>,
	Lucas De Marchi <demarchi@kernel.org>,
	Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Kory Maincent <kory.maincent@bootlin.com>,
	sebastian.wick@redhat.com,
	victoria@system76.com,
	thomas.petazzoni@bootlin.com,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH v7 17/43] drm/vkms: Introduce config for plane name
Date: Fri, 27 Nov 2026 12:39:33 +0100
Message-ID: <awlqNR4-W6a8w6QN@Oarora>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261126-vkms-all-config-v7-17-21194cda2468@bootlin.com>
References: <20261126-vkms-all-config-v7-0-21194cda2468@bootlin.com> <20261126-vkms-all-config-v7-17-21194cda2468@bootlin.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hello,

vkms_config_destroy_plane() frees the plane through call_rcu() and
vkms_config_plane_rcu_free(), which is module text. vkms_exit() has no
rcu_barrier(), so a queued callback can still run after the module is
unloaded.

Thank you,
Oarora Etimis
