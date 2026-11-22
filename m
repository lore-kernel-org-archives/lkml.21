Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795333983;
	b=HVc+rpz9iIxY22rK/5DFmd9x1K0MCm1gkP50Mhnpjci4ixXkNXQBbEb0Lvn3h3n6BrDX
	 KfjcLHR8CTjFp1sX1t82TGBHnnaeTwfijadlF+d9l7UXYq3YCo7JidaR3nuFXXsh4ANBK
	 DA9reH3ox/G5z7RsClJ3ydsVmIKh5gav4cUjpOCpy5UXU5iL8eGQO5Ztg+INto0rpsQNZ
	 9jmwn0WMZmvZpQHGsUKQycN+Cvt5d3zJ95fbdWP8xaSCPQ+sz6ReU3Kg2MUdc7lABeSrT
	 m7OxZ09PjTZODSEj+V0E4TpShoWfbhYsYtJvbyXQ0zUAHcFoNopOdqC9nQ0WTPuy39w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795333983;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=YYjiTYJrCn6f2EJvoqo+mfdpJGY/gBVAph1UiZ3/0y0=;
	b=cm+0PLpbRzwI1X6Wn//jUtYAOPFb+cjuZP1loey9YJYeHxI0tUeyTMoashcdWuMFtqcZ
	 u4vQCfshSgdwwfEHaFed2nFNKzIUL4OqwykqEMxHZ5PzcDsaXQkuHRHW2prPyg+/r67DN
	 w+YLHsQirGs4DvuI+/OBtOSC7zZYMNOlXZF+osM1PlAQKPqd76yIQ4rEFXp4X4PkWmkL3
	 yWWS/lUnmao7vLNLlPjdwc1jQ+MWMFyv9AJzF/uhXJA7n8Rtd7zxXwwAPRyIFdq1WwiZC
	 TLrqpn8pdkJSjalu3TUsYmY5LRfJb5Pac/IlZr5b1ZS1/IUy10mPeoD0psM685q1W7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=h+PoNCJ0;
	arc=none smtp.remote-ip=209.85.208.44
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ACF8606A330
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 07:53:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9ACF8606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=h+PoNCJ0
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6b408f2d936so3311032a12.1
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 23:53:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795333982; x=1795938782; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YYjiTYJrCn6f2EJvoqo+mfdpJGY/gBVAph1UiZ3/0y0=;
        b=h+PoNCJ0JWrepuHH8XR98IvmKBVK3jVik8a77/KXxcdI+xho07fAPKtyBE92aKj9tn
         GWDIeT5DmnM1y4lTMxHD+riQmVoLL91OSnvno9BuwNERToIHSP9ucObNFPkySX4gtyWX
         540MPWlRqpcsRxF1qwudcehjnTwQgvgqaRkrUHUvOSSMzBIEJ9rOTQW31zP7ES6QEZo0
         gidNU5nhtmKgVnJViP2550SwqgkxpCkiW4lkxy40aAyfjyv1G2wiXJmaOk23ixEcWesd
         gbcKP1zqZNoNIpp2MBP8o8kuvJXkcEtlpdjR4cxUcXjmWTY0O7R4zYzVFROqp56VcklG
         elPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795333982; x=1795938782;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YYjiTYJrCn6f2EJvoqo+mfdpJGY/gBVAph1UiZ3/0y0=;
        b=kYEde2TYlit0EAVQBvz4abbGSS87DmGAjA5oB077eicN+EkfdnZcQ8GWk7De1eUFC1
         FHjUsdurD64Q6XA58TIe8UNytZS+rAJTtkjA/uuEJKSYHOgaAC4adZ///wyjYgEpKFUv
         lBu7ZDP0s6P6NaZJl2Ixto0AfoBCt/xPOWQ7wq21etJIAQInX+iLFBBIVyUgQ5JJfF7c
         McI88IDDmwjeuE1d1a71SCZXmXKvUk6pEjcJiwg4buTU2EDynZCS13vxKfxlQ3XJBsvp
         BanaVOfzaiJihkS+MyDR+YGCs7XL7O9K18yp/a9+XmPYGRLJNAQqDb722zAScHH5FYbT
         2PQw==
X-Forwarded-Encrypted: i=1; AL+hErE6yP5hbmhY4P/gKziVZXmP5SHscwpg5jvla23wuOg4afPeCYsJHU2uU+QA2jMa82kp+KhMIm7M0DjTJbc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+lUypbzQsfQz+NWYoXwnHeiw5RQCoBR7LjNuA7u7IBQDMwuPbO
	4rRCb05rsWS6pGWWjQsiH+PFO5HyQGQCj0jXKqdNeEUS6wD1rOgkBoc2
X-Gm-Gg: AZFdTZfCrNBT4s7ca80KuF0+kuDPPT0TRkktp/Js4JlgGKQ8PD9F0kKu2H57pCnGbGX
	Naz6Jz7IDNZanQpckQyg5itYEtE5/r4gvxSKRmDN+n0LCb0BcrScgE2FBGR7E9VgWQSlwtEG+Ma
	iPUnc/1I8zbQlIxSqWDJmZH0J/XhxsnyprGrv80E+kFCJLYtCpvHTtn0zodA7rF2dYf3so7DYlX
	ekgzx07INW0CKfPVgOILLv+9MiedVRXSvkl9xtMjz1uecVqDYvy02O5K5udUftekzjeoyK//DO5
	x4NNGKzmnTZ8of18r5WePtS5xTI28nK6gYj/G5sttEt6f8ucU5FIm7xWXAcSIbLCZ5NG8QIiG+G
	fjxLy9XLSMP+Rj9FH5AMVy2li9rpG9IqS7BrtSL92kZFZyrVLeoVliUhI0RFlR/gIBc4b5VbnwO
	OkLALuZcy9+3qSKoku7yuBxS4TeSqzg5dzUlveMKty0KPRdEUscH5acHGTvyrB/WXZH1aZRD0Lt
	rr9WcsBaKaboJFeA07ZHTUDxCvnauZBMkecoWOLbEduFtQ3C3Uk+nSGFRhtnQguU6lp7w86xphH
	pwIgPa0Rli6ZfpxX9H5+GLDgiO8=
X-Received: by 2002:a05:6402:1941:b0:6ba:7be9:ad85 with SMTP id 4fb4d7f45d1cf-6ba7be9aff6mr1735125a12.29.1795333981628;
        Sat, 21 Nov 2026 23:53:01 -0800 (PST)
Received: from dl360p ([195.155.168.55])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba36e362bdsm3668837a12.5.2026.11.21.23.52.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 23:53:01 -0800 (PST)
From: =?UTF-8?q?Adil=20H=C3=BCsrev=20Tepe?= <tadilhusrev@gmail.com>
To: Michael McAllister <me@michaelmcallister.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	phone-devel@vger.kernel.org
Subject: Re: [PATCH v3 0/2] drm/panel: add Novatek NT36525 (Samsung Galaxy XCover5)
Date: Sun, 22 Nov 2026 10:52:58 +0300
Message-ID: <20261122075258.2919999-1-tadilhusrev@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <179501720308.74840.10845458526829767554.g10-nt36525-coordination@michaelmcallister.org>
References: <20261117173319.1852638-1-tadilhusrev@gmail.com> <179501720308.74840.10845458526829767554.g10-nt36525-coordination@michaelmcallister.org>
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

On Wed, Nov 18, 2026 at 03:53:23PM +0000, Michael McAllister wrote:
> I've been working on the Moto G10, which uses a DJN NT36525B panel. I
> have a local driver, but it'd be good to share yours where possible.
>
> My panel is 720x1600 with four DSI lanes, a different init/reset
> sequence, and DCS backlight control. Would you be happy with follow-up
> patches adding panel-specific configuration and G10 support on top of
> your series? I can prepare and test those.

Hi Michael,

Sorry for the slow reply. I said in the v4 cover letter that I'd answer
you separately, and then didn't.

Yes, very happy to share the driver. Your panel is also relevant to
Krzysztof's review of the v4 binding: he asked for the compatible to
name the actual panel maker (ours is a CSOT panel), and whether this
belongs in an existing Novatek binding. With two panels on the same
controller, I'd rather structure v5 around per-panel data from the
start: mode, lane count, init and reset sequence, and backlight source
(external or DCS). The XCover5 CSOT panel would be the first entry, so
the G10 can come in as a second one without reworking the core.

If you can share your mode and init sequence, or a WIP branch, I'll
check the per-panel struct against it before sending v5 and Cc you on
it, so your G10 patch can go on top. v5 won't go out before Nov 27.

Thanks,
Adil
