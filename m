Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795814218;
	b=qnihnUKcLtaMu/BidNZ1RT75y4u6BTfH0g+xOLWXUnm5lGAle79apHagv3Kh2sgteOO+
	 0sVTLNXzHXa2KQcP0sfkRKXAKMR4gjkz2ZhPYrk8DvkFuubFAqN5ElPEFjUtdsBw8HqIo
	 sQSMZpy8eP9DzuyIvd40OO/lKporXrwVV6kUJTdWZGgBjG2uPAKqLuw3Xd6fljMptIm4e
	 Ulm97nim4/lqDTWfWCyJL6+yZOtZUfjeaZcnriLgEjPzTCb2S+ifAXvOsx8mcSuzMbGQ2
	 dDmJSsazLgtlQwfAqYi9Qz6RAsr5t2XnaJ9SwD4m6UiYzMrY6Jl9O3fFQCmluUX9J4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795814218;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=CRH4oHfnMzxi8/K2BwsJajSyfFDJmrtR0lIrzcFdbWM=;
	b=LqdqRopFRbvaMhTn6Ae6hkBCAcOiN0Ee8FfahTAhv0iZswZXrxcSNUpyJXi8I0GEl9Nw
	 NEUtLNxL64hRIKYxyBiD8bS/kWb6VLK50O0xh9Sgo7Pu0Dts/nbScXWFCB5/nz6WfhBxs
	 T4dJxlDr2dO8LpUKFdXEH18evwcHoRPUTYyQi0TDv6xM9n5GzKd6DmSgPCdI8ND4ybW6D
	 H8oOaEb9OEklIyz2EM/XrPDs5hQYERBKFewPi42iM/+Ix0jr5DfWCNrxbQn/5mq1laIN1
	 50yKFAzYvz82V/2b5BCR4hAXlc8AQLHB1b5vkNlNXdOgcRgq7WqLk9Aotck5ICyntjA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IpVysC+p;
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B92F606A31E
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 21:16:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0B92F606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IpVysC+p
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-384d74c9dfdso1401347eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 13:16:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795814217; x=1796419017; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CRH4oHfnMzxi8/K2BwsJajSyfFDJmrtR0lIrzcFdbWM=;
        b=IpVysC+pjgTWme6Bxd97PUnsroRns0XK7+pwKX+CjAp31y9kouicV0WP6GpbAixeEy
         Dz8VNmDL752Tc23gDLat7jb7iroXeP++uRNI0ThDqgUj4bBE0yQdwWmGIXyBuihHPnl5
         HC8hoJKcWquD0ootL9JJPVd2wAmGi6QcBJ/mk9J1kIASBZzYvNevxMb8lieL+tAV5koq
         ryQ9mC15eylNE72/WF9BEdaQiuT8XKBPY+Vh6ujkaL+kgVM/ZRpQw8MqSDiGHo7U0jRK
         Qt7mfWQvAE8v5cxCY/26zwxpVsGueMH9C1NIkW7fuVQxQXMo2dxGAYAm4LUywVkvKO5k
         0jpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795814217; x=1796419017;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CRH4oHfnMzxi8/K2BwsJajSyfFDJmrtR0lIrzcFdbWM=;
        b=FzOYk01GCw+ACy1kNsQa1zE2LmR2DQ0GKdhYTTt5bnf9mlgiqc3PFuAIDyuyyQKCiL
         KTzHfFWvOCwlrgUePcqJCyQQQoHjXFx8bMJ4Q6GWmRlBLc0mXsMFTxShGHbpPf2oAPCi
         kW9jkpRn4t1URr+3rGPugyt4Pk99xwcVwTeKChzSogMwaa35vP0IQRRVNBMXXLnJ+62n
         nuUPT7RWnrFXyktyuNMwvG7RxkapEt+SLEr2hoQRWtJO5zmVKf1nEU4Y0LXdBij4RCBh
         YmyHmzw0R7Jraq1WZXg/REkqXyOyBH33954b6BZMDls5ejSHO3Jadf8UYfX6rVuaxd6H
         /VTw==
X-Forwarded-Encrypted: i=1; AL+hErHwO6kpBeutTm+6DCd5hCjUbnqu3DYL2KLTuXceWI++Ti2D4TIiCwfl3LkXXD1c/qG9x+nqcCiadkic56g=@vger.kernel.org
X-Gm-Message-State: APuU4Z8aBZU1EZS6rct6z6EY/zcGvGayv8oPGMp15dMuGzkQJfsHe1d7
	JTFdj+uyjBuD+IxF7LM2Rr88G9RJCmTi+I4prih3ZqIll/1VxoOWWkFz2hIhGyMOlZIzGPq8
X-Gm-Gg: AZFdTZdRDq1wOojri0EhqeAQh1r7gyMwLNvosA+pN7LmZYf3ECbT3xw76QaAVGSZtDV
	FEMPagz2CFwQGU3HZRgfSoLsKlTAUP2RR6tg7bdwn2HWGmgqm1F79pBhcN1wZBGr/xKlG9iH5sE
	5v3lSPzvXoIAsAHEbM9FRfgrmaXGl5nEMk6nSpbF2s2P7RkVYohZz5J2dHCxNCVpR09eomsrCZ8
	sOL5Duk/+ncnYf30uIj6pxvMKJ4ubLGpS3ENU0Si3AXG1/Z5O8MqxBEwsZxmQ8AUoZl3VSo3YRm
	nSGHJ9OV6Ovd1sn7+3psC3R8Rup6FK7wmdwtuqgve4Y/AbUTQKJzFF7dgoiDBAxsbNvPyQsbelr
	xJEzG1BvssPHBWF2ilVI1xZkTbCD5IT/894NqnsLWkEYf0X4f+t9tm1JSkfVoiAf9hww+SXFPJb
	LVNf9Bwpz3wf12s4aWv8MdJkwEqqwRTYREEIBrc/yU4qNQsg0N1qsXP7pcwtHSVQ3WwPIZGNFba
	40X4CatgdewbhVaM5qDVwwtNWnywzeX5z3o4P9tlmi7/GZJRHDknKrsVRW70WxTXSKE9uvi2JQi
	/+DYvD81bKfd8TGqXptQnp6H57mcxLlaqjNKIUFqvbCPDohXumsij/Syx/4g9rRfLybxOGR7Zge
	CYUr5b3TSK7y+gvDdCiuUgUSUH4mgQUb25UcOVtMf/GqF6cL6quVoZYdeTogBs2ifz6NCkzWkbY
	ulwswR0vWgLZ4=
X-Received: by 2002:a05:7300:16a3:b0:36d:5fbc:8c8d with SMTP id 5a478bee46e88-3856ef457b6mr36627178eec.2.1795814216956;
        Fri, 27 Nov 2026 13:16:56 -0800 (PST)
Received: from esteban.lan ([2001:f71:5160:2b00:ae2a:b9d5:71b7:3bb9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386aa203267sm44068331eec.0.2026.11.27.13.16.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 13:16:56 -0800 (PST)
From: Antoine Pichot <antoine.pichot@gmail.com>
To: Robert Ijtsma <robertijtsma@gmail.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
	Jacopo Mondi <jacopo@jmondi.org>,
	Todor Tomov <todor.too@gmail.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/4] media: i2c: ov7251: runtime PM, non-continuous MIPI clock, and strobe OE
Date: Sat, 28 Nov 2026 06:16:53 +0900
Message-ID: <20261127211653.1675314-1-antoine.pichot@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127-ov7251-strobe-ncont-v1-0-cefa8c6c020b@gmail.com>
References: <20261127-ov7251-strobe-ncont-v1-0-cefa8c6c020b@gmail.com>
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

Hi Robert,

Your patch 4 adds the same control as patch 8 of my ov7251 series, whose
v3 went to this list on 13 Nov:
https://lore.kernel.org/linux-media/20261113024059.1087031-1-antoine.pichot@gmail.com/

Mine drives the same STROBE pin, for the infrared emitter of the
Surface Book 2 and Surface Pro 7 and 7+, and its
V4L2_CID_FLASH_STROBE_OE is off by default too. The main differences:

- The pulse follows the exposure, from 52 to 776 lines as the Windows
  driver clamps it, and never more than 45% of the frame. A fixed
  512-line pulse lights about 60% of each frame at 60 fps and 90% at
  90 fps.
- It lights alternate frames (pattern 0xaa), as Windows Hello does, so
  the dark frames give the ambient light reference.

Could you please try my series on the Surface Pro X? It has only been
tested on Intel camera interfaces (IPU3, IPU4 and IPU6), so a Tested-by
from your Qualcomm SC8180X would show that it does not depend on the
platform. If the Pro X needs every frame lit, I can add a control for
it. Patch 8 depends on patches 5 to 7.

Your patches 2 to 4 conflict with mine, mostly because my patch 5
converts ov7251_s_stream() and the driver's lock to the sub-device
active state, so one of the two series will need a rebase. Your patch
1 applies on top of mine, but my patch 7 moves the common registers
into the global init table, right after the software reset, so your
wait would then come after those writes instead of before them.

Kind regards,
Antoine
