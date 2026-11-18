Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795005642;
	b=OCN3YEvMT97NyQUyB7T01VLXkgmFwh7m9j1e3ZI9sCWBHLT0UD7+T7p/DEo05133K9c3
	 RlRo2NuEUXkmN8qKjYzgOv9n3uDFBAvFSds565+UYW8h7v8/htepcW2bh6NuowNJmNuoz
	 ypawD9X4mhoP4w0T8/FBQj7uAaMQdplz6vMoatjBHlXNca1nlN97MCwbvFwGjAZsuHxYV
	 +3TNcyWbSVTDfSiqMeiDT/0WS6Vqz8A+LLXYFYFoX9IibxplmL3MdULrCy8iiGOR1M6Bf
	 5clrWhgkEEZxFvqnHmoi5SR6McuB0X4mQ2B0pofjOFRX2VripTID/McAfBK4grilTkQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795005642;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=3R41f+Uc35mAz7uI8DyanrUHiDzSxAIfTcbxQ5KsNGE=;
	b=qCA/6DdnIULauuoM3mZt6p7Gcr/xSsaqbxZBMmA5K5RngphQ3n44lwvRbn/oC5Q0vjVj
	 l6bareDByiAwr7GD9ozl7maJ6TDCwt54um0D7HI6eC/r+l5EdoGPpwgIfzpvCAesq6Kt2
	 5zc9SyMkHnsMaWO62XDWGECZY0b6HOF9C3GeYBpjUI+dhasJ1yow8I93o4/pCkJv2J4SU
	 hFcq8up4LMg9hknOQvva7Tw39rPlY3c2O7Pvow23icJ/8wfmmyYw+g6iMOe7CsSAU9v1S
	 wMVdCcWayK5gjMtfAADSqbiXbsdAnCkNLeh3dSUvZi+tKNIM/i6qNc48kLsmpOIGxkg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xnqozYU3;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCB5B606A325
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 12:40:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DCB5B606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xnqozYU3
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a1b07c3c5fso8777405e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 04:40:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795005640; x=1795610440; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3R41f+Uc35mAz7uI8DyanrUHiDzSxAIfTcbxQ5KsNGE=;
        b=xnqozYU3wqgk0WhK5PmP5yOZMWat21Onnf6+sgImG68WoTaifxU4e8NLRj9klqmAN3
         sBm/1rnOXRF7LkWjDjBT3N2AZPlXNCTYbTdB8xzdjhAmImSKRcbeJrv0ezW7XN2ey4AE
         WOuXU3cDDu3EuefcniQibYvNy3Xgfz2t48Z7+LXaagQEt4XqPnmPahYvJmtwCrOcCaNs
         +iWMdVJxJSZ6XXV46hM/zUu0q2n9y0OTQ+HzKNOoo0dz+qzoDMEeP2EIWna4CJzf/wSe
         gYGPNm3CFxpt0emTgtOOjWZwvzpfIYOEsKWqkAgig0pwyHHBgqrWrDYwlHFHfFT+9tFN
         sfXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795005640; x=1795610440;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3R41f+Uc35mAz7uI8DyanrUHiDzSxAIfTcbxQ5KsNGE=;
        b=OPkb2wiKzvJuhZTYG+E4AfmaDUPsf2pWQ2xzztsk6wqbxieQvquuXTVynX5k9RcRY6
         lUuIaeRAHS4NznpgackLVz4GakU3FY87PZiJbnsHqfPhot7eZZYfJJIr+htgfksdY9IY
         x+Sx0YxJ+6AjjJV8srTaF6qhaNMKiYr8Nol+ShHtm+9OmA4mFA6yteuJIhPJkS8mh24S
         eovHXE3Diz3psdgM/eBU6hCSl6FycHYESOrIUJ1nMzbPpAJyp/542pAvB0ulPGlOhVOA
         H66oRMW1nBySORZsjQZ8phch5QKHPbJdvO31WcCl7gh/iIyFB7xfZPs+EepgY3DmUhj6
         5c6A==
X-Forwarded-Encrypted: i=1; AL+hErEwAxModjFhyjnS2aPZ9t7jbcHZq/QXlzFLOlpmfDMIPKJtO/ra/AeHWLnnaWTjirpX/NOUHoyAmAP14Pg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/56a9St1Q5PCoa02S4Big9wHPPeCRFPnGJ3FjKR5MOLxXF5tng
	AC/XGm2PrLpFLPH2iKldW45T0Xu26FVWV3kcrPHjhX/uLvWnAmqMKPAV
X-Gm-Gg: AYBFou2Tn3mmlnF3ENqWPOshE8t7KUtR/kuQTwM/DaoToCUu2/Zr0KzIn/k1AFds6gv
	0PSy43lkQYt9ZxUjJVwjz2FQcxon5Emi6wJmGNvC3qeC2lKzFJ5XJVpEgZ6bIPJ1mPTNSt6S2Ep
	mYTV4sNQjGXZ0x0+47ZLG0g1JBbfdA61TR+hh4Miz7ryYrEdQAnakLbeJtAJ5YU13dzgeX8Y+Hz
	FsaoR9ZTCTkbcnW8EPh7V8mJxkZNANCTW1tDAnD3SRjPnpg2Flw3lcF+KQ8hUIYYh6LEpLw3LI6
	X8GdMP7hqCFuhdq7R5CRcSp6OqdriU2JqqRfVQyeBXGKXklndXWjtBmI5cuH3pyHpt+r7aF0ccB
	wpVLGhjfNfSV1BSVZHLntju0JT7wOnPpsVHSeNThBIhbnlvEchpCL0X+y2UcMNIB2eDLcjLJHkA
	CvPwlkMo0+BxBfqhnpnJGDT9stsAzltuqtC6+RYurFQXGh9CSjzA6v9J1ATUIOgBuBthdIwn3CZ
	OZCM4ySpyAikotS4/wdHFtNnqtJakSrfoT94KCqPQNop+I0sSgEZe8luaZf8DdMtkuq2/m7gFmk
	r60Cu3BPbnS413vF3ty5jeiNK5p3XsjMyhMfnDcf7vFh5jcfZ3ePEBk9ZCWLcad3
X-Received: by 2002:a05:600c:8b42:b0:4bb:7033:de79 with SMTP id 5b1f17b1804b1-4bb7da4afa7mr45012725e9.35.1795005640059;
        Wed, 18 Nov 2026 04:40:40 -0800 (PST)
Received: from dell-desktop ([2a02:587:4b42:1400:8199:c552:2b9e:c33])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb78418853sm202148605e9.8.2026.11.18.04.40.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 04:40:39 -0800 (PST)
From: Anastasios Papagiannis <tasos.papagiannnis@gmail.com>
To: brauner@kernel.org
Cc: andrii@kernel.org,
	ast@kernel.org,
	bpf@vger.kernel.org,
	daniel@iogearbox.net,
	eddyz87@gmail.com,
	jack@suse.cz,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	memxor@gmail.com,
	tasos.papagiannnis@gmail.com,
	viro@zeniv.linux.org.uk
Subject: Re: [PATCH vfs-7.5.bpf v2 1/3] bpf: Add bpf_path_getattr()
Date: Wed, 18 Nov 2026 14:40:16 +0200
Message-ID: <20261118124016.77086-1-tasos.papagiannnis@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261106-spurwechsel-entwachsen-wildpark-e6322e9caf35@brauner>
References: <20261106-spurwechsel-entwachsen-wildpark-e6322e9caf35@brauner>
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

> So we need mechanisms in bpf to guard against things like that
> architecturally. Ideally it would not just be a filter like in the past.

I have been working on an approach that models dependencies between
LSM hooks and kfuncs and checks for cycles in the verifier.

In my prototype, kfuncs that need this check should be marked with
KF_CHECK_DEPS. When a program calls one of them, the verifier invokes
bpf_lsm_check_kfunc_dependency() to check whether calling it from the
attached hook could close a dependency cycle thus it may result in a
deadlock. The prototype rejects the program if it finds a cycle or if
the necessary dependency information is missing.

I have tried to model the bpf_path_getattr() dependency manually based
on your comment by using the approach that I described. But the difficult
part is to cover all relevant hooks and kfuncs. So I am looking into
whether there is a way to generate or validate some of those dependencies
automatically. I will continue working on this and try to send an RFC if
I can find a reasonable way to handle the dependencies.

This approach could benefit BPF more generally. However, based on my
analysis, it looks like bpf_path_getattr() would not be usable from
the hooks I need (assuming that it will be available for all underlying
file systems). For this reason, I will drop this series for now and look
for another way to obtain the information I need for overlayfs without
introducing such a broad API.

Thanks,
Anastasios
