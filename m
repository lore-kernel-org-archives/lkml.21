Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795616955;
	b=sew5ksWvaXywwX3uy/Id9cfBI0ML18vaoIb4rQpqZ41i7HvDFJy1da/cO3skjiuoc1jx
	 yOvNCkHlCpQHdPnP9udj4oSvq11WCsconh2C/CdriLoNV80EodXIZhFyIKTaU56Qln9zH
	 JJ13nJCpMH12spPeIeg7rriC2bdf11h76QNI4Ee7+uREOLwUY54xx46MxPQtaz4E95IHQ
	 AfGC0TkGiOvYpPJaYXli5xBqSZf71SoM3plCZMcQzzGh6b5STmjXVpBCESwLRntZwAlu/
	 zOxLs+tkya+2uGKK07iDzAkZrUJkYHY5jjWCx3OMnvYUbdYAU0XaSOxNGZP8wrLlnzg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795616955;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=q9A1YCJDeFFdwzOmsp81thQgAJqEwj7kk0aq3hgQikM=;
	b=GHmtbxiEMQ6Ouw0xYC/Q8yhqiyX28eG8dq4LPm64e98/3gnHRZWVXJAu2bPvCWPfC0Pz
	 gz6B5pcy6B5BvC0VIpoSyMoix0E6ENFAbroc9JaXmRSmYiD+QRaHD0ilaq5QV9qrl5p0Q
	 o+PNehAuul0Xkq56o3+uOQFGBLAkbpAq70om0/bTfrParUzDwy+0SktJs8Gy8+GZ6uTpE
	 Cb+Lu+iMV9HRbn+d0gvrc/za+7WilUShPX80igBwvh7Xt14qYZKnwib/Rjy0jfvpS3cpb
	 0XsIHe9SsfW29oUbpWYUcXLWw3T/YWzbOeZkaGfclwsGnKPsWrHm8nyFTBfRGENnCFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JyleQgEC;
	arc=none smtp.remote-ip=209.85.215.172
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 236EB606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 14:29:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 236EB606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JyleQgEC
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-cdb8c4233b8so249324a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 06:29:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795616954; x=1796221754; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=q9A1YCJDeFFdwzOmsp81thQgAJqEwj7kk0aq3hgQikM=;
        b=JyleQgECgWA148I0Kf3/BXbuCzVuq1QiZeY9zowpSXS+oae+cU4uGcnanEj3jH7+4Y
         Yt0ht7TpbSNq3otdW6yw+sZmr4UaCH3MSjoV//f1sNgaFWgLg02lIeZ6sWHER/P6/qwd
         6q4KBqBLoXIsQIJwMD1PvInL7j+HFSQetfgwTSSdIUrytUu8cXJcQkhb2/8K3CJuhuYa
         ncLZahvPk7lCvPgFVRTh7i0vYhP0F2If2IGo23vCELE6LPpjcHjyJHzPmaDmNdVZ/bMK
         zpXgyhQ13yb+3Fb3kUHtEW7SI1K3NYbrsAcXygPmbKk5WjBUEYdEaTp/f78OHEESRuTN
         O3JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795616954; x=1796221754;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=q9A1YCJDeFFdwzOmsp81thQgAJqEwj7kk0aq3hgQikM=;
        b=PP8WfJeZcBjo8BbEnNcOkI64XZ1hMkbck4xjerseNLZBzon/8jciJ5TrMUJwvT7WTp
         SGpOO+LK2VFjkt46gR0WhIeLQOzsmUVKBICSV8p4K5VRY4IZmdNcBRoJbtB5t3280+Au
         vhyTuLif97IXRXMbyKP0HGpFpDffGswUP/IgJ1CQXG7k3WmHacBz7rUmzZd7FQUnI9MD
         IRV+eJDV0ys50M6334w2SC3DT8W/6GywRNn7qdJj33amRN8aMRu2T6utqFK5I5/DvZob
         i7mz3EnSJI/LmSwk0zvcoUTMs2a3YyE8PdbJWlhzCqy3Pt7mMyfUJ0IMKfgzkH4np5sI
         OZWg==
X-Forwarded-Encrypted: i=1; AL+hErHvqeXQdhstiMjNBPOAMDJ3fcEDW5ErUut1F7YcARxxnsdYUJ3Vx/jd+Inrko78auCXMTL1FAGCao6w6hI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/XD3xUvOS6TMxwEwldMAKiNzIhWvEXWAjbqVXRp747NdiJNeO4
	np+0P3x4Iywvi55kXbckZf+iRqenyEKWRv9+IdsFPwmjZo0U1wYLBu1gabib1g==
X-Gm-Gg: AZFdTZfBChszHCC6OJ6uIPw+khMGNJFDrIfh/I4nzow+1Uvn79zqHTMnccoN0boUyr9
	VeqjI9k2jnzAQfhnaVZEm+pkmOETpL3XKfp9B1O88qPeEonGGx3YCmyEARvvM5QW3Ptfd7mkwWN
	93sTbjZjwwNmPF5PJNwAL9z86BXp8DhWreVSlwLAPFoNF9iQazPhSK/GfrI8s07bgH8S6xwcPYj
	wofN5Vzx68OA9AE0sbIZQUFNwbdjiSaRovWPJ0xznvsWHn5HdbmUVp9tyggpGPlrw0PvsMwR4a/
	LcYe6G3X4RAjn8RoKOJO22mDlrblBbAUoZxBQk4G20gKilzKkiIM5XhNt5O3g7LOTZsxnjxcM27
	B5Ua7vMbsw84JSslMMIMwTLG1oVqtUp0awNUnZsNNJiKqA1ZuHjjcH/lHqJVL5nhKDtscScy+ul
	+U0m6Tp+oUD4LUOYa1L0OCaM40Mt1FloIfY7a1nAG6zMJTDEpK5IXRzVoW32Vn4yCjKS4//R3oa
	9fTYqMk9g6vojkJASiYmRvSW16PfbOb4+UyWhV2p7YDVNuVf3Y641fLESFc5tdSagGsNyHDDALn
	Gx4ZZq1pYkX0xu7/QaNLbYYeihc=
X-Received: by 2002:a05:6a20:9f08:b0:3ef:2f72:c7e5 with SMTP id adf61e73a8af0-4014ae6fe31mr30706224637.2.1795616954301;
        Wed, 25 Nov 2026 06:29:14 -0800 (PST)
Received: from marchy ([2405:3800:9df:1a8d:ee8e:77ff:fed4:d18b])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c873f16b41sm9085822b3a.56.2026.11.25.06.29.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 06:29:13 -0800 (PST)
Date: Wed, 25 Nov 2026 22:29:11 +0800
From: Adam Azuddin <azuddinadam@gmail.com>
To: neil.armstrong@linaro.org, maarten.lankhorst@linux.intel.com,
	mripard@kernel.org, tzimmermann@suse.de
Cc: jesszhan0024@gmail.com, airlied@gmail.com, simona@ffwll.ch,
	andersson@kernel.org, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 2/2] drm/tiny: Add RAiO RA8875 display controller
 driver
Message-ID: <awbwtxoToNU3GEcc@marchy>
References: <20261110130515.45819-1-azuddinadam@gmail.com>
 <20261110130515.45819-3-azuddinadam@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261110130515.45819-3-azuddinadam@gmail.com>

Hi,

A gentle ping on this driver patch. The DT binding patch has
received a Reviewed-by from Krzysztof, and I would appreciate
any feedback on this driver patch when you have a moment.

Thanks,
Adam
