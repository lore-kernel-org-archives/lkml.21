Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795846154;
	b=iaJmHBr6mRzBQTE+pmoLFOYB8aQfFGhF5rhPQO+UxvmBIcJflL7ZcwR5SvXgpsSQJyug
	 KCmsUBhMotrEh+PoPWUh3tUfYVgq6GyUE1I4mmjVPlcKplR3iuU3pUHTxCYkrwP3abOr+
	 1eTn3HXHlrLsANiNVN/949jsK2Gt3cXoONX8f5eROicToMSkNfYnGGRcDVg08GvZoinIj
	 Ji4zlfgR4tW3Kpb/beVUK+cCBJ3v+d0a/BpkxIFJbSjlqWFY8LPEvkFF6lEk3SceW+MoK
	 EvCQgJjtRrqAPYlcFpcmAyYy6/lCRJTyzGvnVqzqxyve7nYrgvq/p1pAon1lyWxseog==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795846154;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=nQ2O6ohYt8StqDgtNbo2hP/n3Jenud58IIFUvX2imSg=;
	b=TBqB8+XBKRrPLXzuBVw+RyiH+/Q0J6KvDbRYWwQuerWkomeQlHliPMmRX2gcF6KXQ50e
	 PS19Gsw5IslsftVszcO2Wt8WlnKGDfAyaz3BpAg1nBFnOE2br4hrCwGp2iNZwdMXrIX2W
	 o7OjMtFh+LBLCjgwDR5wjxCyEmKBik3V7xCdIJyiy/6nU6kjO/ubNXqGkQCokR3q9vlkw
	 pi+MTdGYqEGrSkNq47ksE9YDrUp+JZmOSxvDURG80MRhpAOEk/zJ4bCmyXr44FecJBPF6
	 R++Vwr3kAsK1+pf7ptv0S70osYHiwp6ypt4VkkPKOsL0OTQl39gs+jqrQ2FJwNrFYaQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="hpeu6/EH";
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFE75606A31C
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 06:09:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CFE75606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hpeu6/EH
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-386c71feeeaso5375357eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 22:09:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795846153; x=1796450953; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nQ2O6ohYt8StqDgtNbo2hP/n3Jenud58IIFUvX2imSg=;
        b=hpeu6/EH1AuoMfRw2oJ6yRS0XG3jb8g7+4INvymDZDTO786NoYh0nYs5X7nkugYLZJ
         7jlFYhQl8Z+w2GGBQ+/FXkUxEZaOUQ4j20E03Zrs+4WauRDRGOjSpM+7u885W9UXMeGv
         4ojNOZ0yGsu8BF/7iHPP8VKZ8brkhe/TCvjE0RgTHiksbrTkDNdVnMRunY04himK9uAR
         LuW2vOtyR2uQWqpBKgc8qRdDyEU63S+5hNui5CI+qoMBCfxqgyUhk444O1PKE0MYrGGf
         FM4EucSA5FUL2NS8rpTIDVdg70ZpZAZYdbm/Phw/N1JBmJeRGRYdyBh0G5FtSY9Km5ZD
         my8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795846153; x=1796450953;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nQ2O6ohYt8StqDgtNbo2hP/n3Jenud58IIFUvX2imSg=;
        b=LOlEMx8s/mswrfbRx0V5Evg+L+xv7Vu6CyOuFLU2V2P5yrLzjqjh7VkfL8oA3zXJ0m
         S4MHq/+JYta0/lIgZ2GO9OG2oLyZ7hLVCvB/gjTTjWCXOhdt3Nlm2HixUIoYnspQDVd3
         pcW7ewA9lVacKRBssUdCVAfdXCOTVWfzbTBb2hqODpI5J6oo8kT8XHdtCMZ3wOY4fouY
         N6IfRDlc8RLc1hfHwaWuS2vue/3lPH++jD9P8HTlc0Jy4AIfYz5Ba05r6sLEKFj3fsI4
         5eFtEsCCIUjiituH3A9D4+TQpfB517kBzywZ65Dgi9uG6+iB/72mpowCCqkHZf2tMrEx
         wIQw==
X-Forwarded-Encrypted: i=1; AL+hErE0K2m2IYPnLUOpqZWR++HgWtPQugEtVWaU9KO7ejgNlEmfUdOXC97STEU4iX9OhUlppj/SeBSrWT6mkXk=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Fgu27WP1+7K8aFTokhvleuntJz321SxKF6TldDXB/xMmct091
	XgFTSSZAy4TKQlEFcRNJecEweCW9Suz7+Fap/dCbf+ppTtKKcMlP+DIb
X-Gm-Gg: AZFdTZfFUgOQ77xWmn0Rw7M/0Z8/ErL4+vEoGwuNA1qoMr7eRxFtXdGmd6QJFpKI9ag
	ira9g96K/ajkrQhZJxkzF6q6Lv4cHnIzfDRdJYVxX85eA4gXk+L8JDxBsukfttyKtKa4WrXklUI
	ztl5GIIISFSWC9xnFJlu/5OsmCm+qR3PoIzjQW2iXBMGVXy4TvvNXOOyZ20XmF8w5SLwZTyh5nb
	jdn4aCm7VyAr5qQFYOgzqdTgcFu9f3R1EGfgMNi5Ul+axQ/JDPt+aVdaHLPygjeesFrHezmy5aH
	R1Tzn+5jVrJMUICGfwwCQtujFZYHPJz8ZdTWaBeIH/5UpJGMbadMUzAFrUHfiH+YlqYHE4a2uLv
	oBRBr9rvZa4/DxPPwgpmlR+1WKP0LW5lv4DOZfYrVERNr+rV7QnEpFs3jGE4kFAmKTgjJsEP6yL
	tC4C2lTCeBND/ioyEW+4/2a+STkbLZ9J4iPOLkfDbKpyZ/t85LcALa48jixRs497qFjHlPm7j96
	fu/dg8aEv/nMjoQOJ3Uu+bVgxGc8b3ILDBkTS8AbULF0/n+L8qVZ8+C816KId9GkLam78JMDYJf
	i6ItCY5AXrwCvMdOnpKW3AFllJlQRxEIBA63ZyuNZv5VEBvdmwP5mW3MyDhWBaUuSQP+CJYHg3e
	vCvvBrNyKC2cRxfw=
X-Received: by 2002:a05:693c:87d8:b0:386:b896:319c with SMTP id 5a478bee46e88-386b8963d3amr15639221eec.35.1795846152934;
        Fri, 27 Nov 2026 22:09:12 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:aaa:5a07:6335:86c8])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38566fdce48sm83886487eec.14.2026.11.27.22.09.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 22:09:12 -0800 (PST)
Date: Fri, 27 Nov 2026 22:09:09 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Lee Jones <lee@kernel.org>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, David Heidelberg <david@ixit.cz>, Andi Shyti <andi@etezian.org>, 
	Rob Herring <robh@kernel.org>, Javier Martinez Canillas <javier@osg.samsung.com>, 
	linux-input@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH 05/10] Input: stmfts - fix
 i2c_smbus_read_i2c_block_data() check in status sysfs
Message-ID: <awpwAc8i8VE29tt7@google.com>
References: <20261127201050.3532488-1-lee@kernel.org>
 <20261127201050.3532488-6-lee@kernel.org>
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
In-Reply-To: <20261127201050.3532488-6-lee@kernel.org>

On Fri, Nov 27, 2026 at 08:09:59PM +0000, Lee Jones wrote:
> i2c_smbus_read_i2c_block_data() returns the positive byte count on
> success or a negative error code on failure.  stmfts_sysfs_read_status()
> checks if (err) and returns err directly, so a normal 4-byte read
> returns 4 without formatting buf (exposing unpopulated sysfs buffer
> bytes), while a 0-byte read formats uninitialised stack memory.
> 
> Return negative errors immediately and require sizeof(status) bytes to
> be read, matching stmfts_read_system_info().
> 
> Fixes: 78bcac7b2ae1 ("Input: add support for the STMicroelectronics FingerTip touchscreen")
> Closes: https://sashiko.dev/#/bug/linux-bd87edf0-6f79-4318-8780-d69205787e7d
> Cc: stable@vger.kernel.org
> Signed-off-by: Lee Jones <lee@kernel.org>

Applied, thank you.

-- 
Dmitry
