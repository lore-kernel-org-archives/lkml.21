Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795617690;
	b=W/s1BfyOiXPojYTiTKLWPEildX4mhaI28uwFRhTwobGcqYNsLX2+so76tlOkUOfF3fSK
	 wRn6rF+uchg4f3G3p09EsL89Yl6vSlzANIeXK/XPm1Eib4x4Gan0M70DpFUBX1rc2CtNO
	 j2/rCkL2t3kFZX1DSao4y+1qRJfN1aDqLAuYanXARnMAmum/rd9yReoa5hOVxuGc9KZaD
	 MihGvW+jxM6EbBKZ3p9iuLWj3qlrSsfUFHZmM6kQBrnGuNbh0xFtrSpalkKxEN5RAdE6x
	 gnJHU/xlkyC9d6bRK6p9jZqq6etC6V0/FivMK/YS4gZB5fZqr4Xi/buKd16ESUVzu5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795617690;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=C8wAVDCriQKpBgX/jVo0IgbeLC43EIblU+w+9MjzIuA=;
	b=mFquUGWeq5ab9KfgPQ5Rqf9A+6O7C3pklitMic0GjBk/DEwX2e44qD0G4/EB1wDX7GeT
	 fD8GUL2IykthKjKNkRYiGjS3gFHkeNRBP6sz0iC0eHmri1oV8VSn0tDMPyKNh4lYj3hCk
	 Ribb9wGHMClPiPIE1sXRCK5ffCAb/1wfSDsRDmUDSdmuiZ/rL0kQUjSUHEr42MZH3cIKy
	 mVJUbkPoiC95AvS/86rMTkdnqAJ9Ht6+LXAyYy1/DJWT53mCvdcR3+rED+h0peCeUQ3TZ
	 W9KFn/dsFDP93BZn1lrR/iJFBKRR9jYOSPefwpmp3zrOb3tr0UdSO0UZMsltJLRJPyw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sxGrUthw;
	arc=none smtp.remote-ip=209.85.208.53
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3039F606A327
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 14:41:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3039F606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sxGrUthw
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6b87a1a2babso12287800a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 06:41:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795617688; x=1796222488; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=C8wAVDCriQKpBgX/jVo0IgbeLC43EIblU+w+9MjzIuA=;
        b=sxGrUthw3PgdlHgVxJKxLveTYF94vC4Q25lC6ULnWml2NQRE8JwZDTITECUm+mEMS0
         pyGtkOrQoTMhTaLfpdFxD4qTs9dtr0xHLcMqSbTn0F2y1RGPLYZDLFE7/+Lu67S/6yY8
         6N/XlK75C1Lf6nhuNHGebRezg/uPcUkaDpIIeMVM/xq5yvf6u2x9Jr7MG9akG4MS5hSL
         j/sj3letj6qLOzJfnBJntFE7bQr8GMj1PBRRZLSf+Z66B7mQiQOQFeZjkdP2Qk9DrBnV
         MCUTxoiW++fUYyhq+vo9u/g9J75Y3ZL8CaymGZiIR8TvnkPbt6rPVJcRVU17tA+XkNxp
         t7Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795617688; x=1796222488;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C8wAVDCriQKpBgX/jVo0IgbeLC43EIblU+w+9MjzIuA=;
        b=VYTX/iKSwTA2hri43AaPCiyFJUZE119jYc+EVvMa3mVlK0Lt4Ndua5Gh51ubQgnMvE
         1jEnw2Jyc+v48DUS4XILSc/fgaXDPvhdGMX4ZgjoJzjML8Kc1PJQYpatlOH9dTL049Yi
         kVYfETvxJp9q3iDeX7gx4Y0JQZQ+ld8KsqLVbWHqsxoYpZI51o5Is+GMCq2JdFQRdoRZ
         eV411BncsQmWlikTABxosfD7/PXHbz+U0V0gwHarvs4ZpcLnv9Tlt/4oVIj4Ni4thGkb
         zvyCWzSHXBvMkA3hVPU1kFuWik2igrhfwJsVhakBbSWC0r2Hz1dl/niyh7ydVltgoUiv
         Dk+g==
X-Forwarded-Encrypted: i=1; AL+hErHMl4zzcRPzyG7IBg+hvQQfsM+E+/Ird2QtaDSHFlZQvy0wboRiLgY+l65VsARVAU6/5vR/NB0s2fNOp6E=@vger.kernel.org
X-Gm-Message-State: APuU4Z+SUuzIYPSEIOGlyzQmIJu0E5ZBjH3I0rC9OuHmTLoGlkI5DCNM
	DLbrlv9M3GvhdcOVnEAeg7FJ72GxLJciKqE4rKi9ECdc6HGnjFMwoNie
X-Gm-Gg: AZFdTZf/k72roBvXte6LyAS+jrYBl+WDGMjs5r2HUxrB3VaQeK90J+lQTZTov72K/Qn
	w3QEmg4N45Qy+g7OBedhlrhII72BLqw2megwJLe+WYiEG4LoGr4wL33v7SBoGl6RcpQ8FdZlFmd
	RBs7/Hh8VYOFlQmQGD77xw4gkVAhWkO8H5EWnMissEx6NHSlyiZBJtbJWjGEMRyMqcypTjNk25y
	j8ml/dLTe/9Xo1ng+Xfsg2VFLSietgkpllymALR/ZQdYy78sWwz2rNpKVbKjX1ATWlwA+s7IyQV
	POaIoALKWQpGEfgDnfT62jpZbI3VUlijx12kkEfizFIjJmS2IqBVEuJx9CrEvgPl0gHQGKL9ySH
	rJog5LJhcrrNOzgAS8rIy0QytQ9f+ecveCsVotH7MWqVYgqADIEnpsQNXSfNGDFTZW2bVYuuLDG
	Bq40CTPl9GjmpuSLLPOUvACPfhK7534xyOpPI3YKdBPQYWZZ29ShW1GQcJo+Wzls16u2GceCIAB
	2+Y1MapANJU4gYXX0gaSNKVw8vDy5WdFIZvtgBwVfK8OEkEOjw3WsvHps9d+X+m7ltGr0Hn1XDt
	MD+jwiiL27rdTOzTGpWven41uz0fw6/vlBr8znz/S0qeCOo=
X-Received: by 2002:aa7:c0d8:0:b0:6b5:6b89:e3b0 with SMTP id 4fb4d7f45d1cf-6ba1fc3dcfamr11494812a12.19.1795617688216;
        Wed, 25 Nov 2026 06:41:28 -0800 (PST)
Received: from localhost.localdomain ([195.155.168.135])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6bb1ca4ff7bsm1437512a12.8.2026.11.25.06.41.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 06:41:27 -0800 (PST)
From: =?UTF-8?q?Adil=20H=C3=BCsrev=20Tepe?= <tadilhusrev@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Sebastian Reichel <sre@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Kaustabh Chakraborty <kauschluss@disroot.org>,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: power: supply: add samsung,s2mu106-fuelgauge
Date: Wed, 25 Nov 2026 17:41:25 +0300
Message-ID: <20261125144125.3951425-2-tadilhusrev@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261123-hot-stallion-of-fascination-eaa83c@quoll>
References: <20261117104328.1176951-1-tadilhusrev@gmail.com> <20261117104328.1176951-2-tadilhusrev@gmail.com> <20261123-hot-stallion-of-fascination-eaa83c@quoll>
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

On Mon, Nov 23, 2026 at 01:29:03PM +0100, Krzysztof Kozlowski wrote:
> Exactly the same as s2mu005. I do not understand why do you need a new
> binding file and no one suggested that.

There is no good reason for it. I'll drop this binding and add
samsung,s2mu106-fuel-gauge to the enum in samsung,s2mu005-fuel-gauge.yaml
instead, without a fallback.

I'll also cut the commit message down to what differs between the two
chips.

Adil
