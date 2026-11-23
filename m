Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795403402;
	b=oEsyHvJT0aWEfpWpJKyUWXP7MxfFM9JkSH3KuU8hgC4Zk5mmkpPOojRgwEICxoQMxyrx
	 wPlJeczuOwTKogTR/c/xqDXhzLC5jzvzETMsLEoW7Nm7Mng2tqjGa0s5AntKKaakA7TvI
	 VrLR7CTIFmrUOrPpiSTPq0BMRoSFAYHL1pXM+yg3YnJ8271deoU2691PtbGQBx2AMJv3p
	 zq0z6Bwd9iNayueQNGhwgek0NR8fMhrr8wQEXfTMWUOpPHA40QRwXVesifSPCXv/KhI7K
	 TViNzeboXuLn0OOj/7IOIh//K+GTCYeqpUBbvNuBqftqyvYJVImB/kVMPlqruotjatg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795403402;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=BKJVZaS7a8HTdoTnBNxg/XnU130zaQQ9ueEmJs3IAi4=;
	b=ItfK7SzBMg3kBkEz9izeMEs3Jkyjyp0TRr7WMoWenASriDwEj7d6Vw+1NNyHLWqvybEf
	 +zW/KQIgzVEi4Cr27qEQmlE9VNwBmDMJhCAPXHAywAUUN1mQDAsyyVOR0ddcxidILIjLT
	 7cL6WuCTqooJReKmbaKk2JtM3O6ZAcVvgwiCqdZA593jVJasCVrCCtGU+dqox6UtFQjqI
	 u4EgeZo5hTah3b4xF2Mmgrls2dolBglcXpu6nIBEZ/CLPlY2tPzUp1blIrtCAQQfAnAxP
	 6b04STG6CfWjP+7aX38ymcfbrK1PUaV31t4Z+h4qXBX1DOIMCR0dyhNPATkb3LbSnoQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="F0/Hutkv";
	arc=none smtp.remote-ip=209.85.216.49
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E51C7606A327
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 03:10:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E51C7606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=F0/Hutkv
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3b3af93b85cso1541813a91.1
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 19:10:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795403401; x=1796008201; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BKJVZaS7a8HTdoTnBNxg/XnU130zaQQ9ueEmJs3IAi4=;
        b=F0/HutkvyCPPD/aytB1JD5G7BY2E8YF4zhuo/p55tqfkaRr+WsKcsuopxTxulvwM3Q
         vVBmWU+ddjKkQYRxhzXDLcESmv0KeqgtAvYaBvSQ4qbO3IxuRaHgHDDzscdJNByk9DxA
         eW8xSE+AeVmN61XHnS3WK4NQ9hhPAK1mPxR0lZNGBmRxidoxB0W+3B7W82KCsSmBc4yk
         pZ4vE5wLNaBOxtvOrsGyFIr2/cI1EoO8hQiIAdIZATT/Wt0iVNSJrNcZbRxBr1/Z9pwT
         w4xGSKQWxlKeo6gdiM3lR0LTdQa1L8OkHTJw2jhmEPNU1djls6w3SwfIoHlSC4QFOorH
         M3EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795403401; x=1796008201;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BKJVZaS7a8HTdoTnBNxg/XnU130zaQQ9ueEmJs3IAi4=;
        b=ZYGisK+qRcdw85g9o+HJsHYXKjQD7HwTZxYMZ7msh53ez8hX+wGWG/h1sIwq6y6kPF
         zB8qHzuPAduWzU7VLpe1P48KbAa/d2pG6fHTmAkQK9A0dhNqFpJLDUxMKQWLb3HmyhOD
         3XM59nmqZVkSN3NRUqb6jCPQ1XTltuHDk2o6blQ5G5q/zDepfYljVSpc3zEQgu2J45bc
         otXsls46dUzWya956a3f/9WZ3SXuQaRDuizbOGCEhuuiFgNF8KRRpY/vg0IUHBMIkGoK
         idPfSUHgWoVh6v0RLgcsz2oQdExQInDHIObsBQPmb6aB84NjWpu/2WdiVYtc1EYCxuxJ
         WLgw==
X-Forwarded-Encrypted: i=1; AL+hErFHWYXWdq5kUUPMwsg1VGrEhve7UEbGyLCvn5O3SGBLPEZO8JD5ULIdhDKGTrGNmnLTGy4g3ImwT8UsWJo=@vger.kernel.org
X-Gm-Message-State: APuU4Z/rRKDW1AsAoTZWuzUE7RovVPRWGEx7rzvn2eX6IAJpbw61+mB+
	GoDlFURAjkGJcJJoiCL1IvunWku0JkhcqBcZ6eTXXkO99WHho+qXJPJ/
X-Gm-Gg: AZFdTZfTqsY3Uk8iuZmdfyFg0tDmRpZWQBz+w8JB+S2jKaqKcuiCQVGC2ccs14QhuOq
	ReeqC69P+YpCpb4PeaSFRxSyOQx7olYdfsv8TT8CnuaLXEn6P+AEU4Y+4ATxt4hJ1xu1W1TRNf0
	keYymwx2SSvC9IxNLMk30TT2vqs2Xc5iIeGU8OoihCWEe182M+z64kT7WLhDLATEUUkZ8RVOOHY
	qeGHJHW+PlJwceO7hud+ONZj1yzwphTaRidFPiE2TSY0Rt5Tz2oWSP34zDl/dkQ9odb1QSW1wkN
	HPQn+wykWiQi8gc86JXAbbOX/IdVz8hdDuy1W0ZKrFdRUllGPQ+JndFH/h6zBkfrLbM5Yrpg4R/
	BzqZvjn7cKTK/A9a/lmyKCvGLzK9LlXh5Tm2j1pc8nNEp+T8XLLFPrD3MI17gPFGrzH4lFTgGvE
	LATFK4pJ+vGgJ+vU0iKuKSnUeB57soYt4wLkbFeC9XE+TVpK60kyD255WJkV4MYK4da0/jxEhn8
	/Unj3485skYQTLbpcTDBVzdQYmeEl/P93IZHLPvFcYGJsAzHriAa64yivDSuYchdh5X83ksZr06
	588vnDqo73EwzluK0+9sWwy2BAlL80Q2RcT6KTDvwRNhLA==
X-Received: by 2002:a17:90b:5887:b0:3aa:fc22:8aad with SMTP id 98e67ed59e1d1-3b41c97c995mr10199877a91.54.1795403401097;
        Sun, 22 Nov 2026 19:10:01 -0800 (PST)
Received: from osman.mioffice.cn ([43.224.245.178])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41adcfe16sm15693445a91.17.2026.11.22.19.09.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 19:10:00 -0800 (PST)
From: Zhan Xusheng <zhanxusheng1024@gmail.com>
To: ernest.borowski.git@proton.me
Cc: linkinjeon@kernel.org,
	hyc.lee@gmail.com,
	liubaolin12138@163.com,
	ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	zhanxusheng@xiaomi.com
Subject: Re: [PATCH v8] ntfs: trim the sizes after a short write
Date: Mon, 23 Nov 2026 11:09:54 +0800
Message-ID: <20261123030954.1614965-1-zhanxusheng1024@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <179537167473.2649834.14001007738076272792.b4-reply@b4>
References: <179537167473.2649834.14001007738076272792.b4-reply@b4>
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

Hi Ernest,

On Sun, Nov 22, 2026 at 06:21:27PM +0000, Ernest Borowski wrote:
> Zeroing from a worker when the caller has a fatal signal pending fixes
> it. Something like this on top of v8:

Thanks.  I reproduced it on ntfs-next f674e4b6c315 at 4K and 64K
clusters: with v8 the page stored through the mapping reads back as
zeroes, with your diff it is kept, and v8's other tests give the same
results.

I'd like to fold the diff into v9 as it is.  Can I add your
Co-developed-by and Signed-off-by for it?

> Patch 7 has the same kind of helper in fs/ntfs/iomap.c, so whichever
> lands second can share one copy.

They zero through different paths: the one in patch 7 calls
ntfs_zero_range(), whose ntfs_iomap_valid() only accepts delalloc
mappings, while v8 zeroes allocated clusters past the initialized
size.  A shared helper would need the zeroing function passed in.

Thanks,
Zhan Xusheng
