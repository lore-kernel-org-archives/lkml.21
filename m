Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795852920;
	b=LPsQDxu2JlCZ3jr3oWjj9r+EBlusHTOoVGAa58LcccP6qqvTU2jSgYt1D8O2xTXHw1OS
	 yAFbLpJZlgpwu+KHEpgTPYuXQUOKj58tguoxJwlXlYYa1+wPr+HKiQjyjrataHhgZe6oQ
	 Aw0TtQEAWECYK6AumT750UMC2cTa4PUvL6gMztwgp+VCRR2PW8rvV9vSHDbL9rVufTLod
	 p0qIcVtyz+E4zhq6JIaiXKfU5YGtbvzpI5gJ0yLQnzK+EyY9QRqN+e6ueLM/o0RLL79KP
	 0DLhxdFTwfewoNRx6QOUEyS/LV61UmXzilwtATsHG7WT+ceDu01f1dXJIoWkfIMEj9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795852920;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=2VH8TKNApaWKBTCZsoWJkfGILbIk1yohTz0ELTrOx1E=;
	b=JxLKKizTYpXXRXcjGcpsIh/6+wdd/PDPSC8UB9V/K9TLYByE/+40gwAi/erZV5ItSrvG
	 KFtYz/Rsn1JPFsBE1uwvvojxMaeBd5tWwL8b2oy+ZykXh3iY8GNEPSiMLoKFov4uC9y9e
	 efWbNi2GBW0Ha2hvCQVllqp1M7pkMmgQE2P9TVXOnJjuGYh09i46lflrQkhJ0ZnjhVNvu
	 rmqHwzxDeN6W4aN1pd9ydVdugtlt/FvWTcyG9bxXa9f6pGqc9tHCXcQ0OIfl9TBi/O1qr
	 qaPnrayb008zGlGiEsu5lp4K/MvTDu21SamK4JeNkMq28S7xCuQ8nY5nedXJRz62ZFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KBPKvO1Z;
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92F06606A31F
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 08:02:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 92F06606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KBPKvO1Z
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-386ab9ab619so12461213eec.1
        for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 00:02:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795852920; x=1796457720; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2VH8TKNApaWKBTCZsoWJkfGILbIk1yohTz0ELTrOx1E=;
        b=KBPKvO1ZVWaczlxG13T1esDlBFdx/ATt+sv107mfFcvi6RFKHK9SWbxUABLb9HPmtq
         tmhBWh4cx2ReDN2nFgztQMzDNx+KCwnIZZDSkGB9xm+NPoFqMf7mPKUtz/IHb4X3YJz6
         jBWpflIwPpmCgKPlL4Xdhpf0SC7ltW9cQ8NkhuvSXZ/EqJRqKgkfWHj4le1hWUjloVSP
         IIUWtNJqhTqBa3CbAVD8NuXbNgpf2LW7C7rI0uzhEH5ZIPreSz+p5gEKGZpmPfnw9VGN
         UxfBVTfgXXqV7sYo1d2m1icsc4EgUti7JACIWdTL8tyaf2i/lh/wXY5kxM37IAT/HoEW
         N0NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795852920; x=1796457720;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2VH8TKNApaWKBTCZsoWJkfGILbIk1yohTz0ELTrOx1E=;
        b=vzoxmksd1aaXnGzVIFXPJF0IVZDwADSnj0UYD2x+IV0ZARsAzUy/ujaIG7UFD9hy/S
         hOAuEISNsrsZC8GXiTKYpm5CmPvsVbhEc3t6kcvc6S4cuSNK94Kq6HFIvP5Zx59p6VMo
         vJU6EOtZayEAVWJRhaNdeuJggJjKMs8XFdw6joup3hQo9Zo2GySgbyNAfXTyfNlV/Xt9
         E+MhVXTRZF7MjYY63e+tLZhkSSppsnb+q8QW0Fufe3fF28MsVGUC95pZLJF0w7nyxVb8
         oULaCCBPaaWI6eC6QQ+hNQmqdvrNaTxZ/1Fcqy96tRs8L2c1O6urFDObfP5XKSESOY5+
         /c3A==
X-Forwarded-Encrypted: i=1; AL+hErFsG4Fc9QYvEUpQr8JHweHqlYE5rKecCcM/i9Q73ewzHZgOxgo8/iciwlHvRKYBHVFE0FDJnyhd+VQLpUo=@vger.kernel.org
X-Gm-Message-State: APuU4Z+ylkHrvIe8S2V+HdcCDGqoVjivmUVHzvMzkR4nXReC3SnZC/Yx
	xVdltkSm2rlzjM+i8GWgAQYcsMWD4aUloBVToEcKf1bC8puRNWgsMh8QNNfVGYOeYZE=
X-Gm-Gg: AZFdTZdr8iMBSo4OBvKK5uOLClEHKfSZhD49H69Rk97OWfX+5hhxgHqDP0YwsIWBpI1
	JizhUkh9fEFqrAfs29SE2mh4hr22G6ebPJw/t4jj0UY+jNRmMCneOU/pOGYv3azs7hchDtl/WfR
	95TcE742sSA/vOj5jhMJoSOiQ4JAzGLZB+sjY24U0IL/hlvP7PtuhONBQsj1BSrbQG5n9gauKNB
	t+RkrXAS1V+UYm6UR/fwvSUaAw1bPwwC29J8l70z5cziYC3Y7ZFoe7Lufj51v9EKRTLeYNhmKkK
	0gB9Q/qJenOXs4gNlO8CfebPqDNlMgS5WQ1O10mmZTv8bwI+N7Pk+XIVPMP9LCFHWkhkDQi3gAl
	YcFbbLqAKZvfK6tYcyP6DlOQnSsX32LRQh1ljv6Auq11vjQrLtKfWI0TJjZRe3JDwUorcDQSDid
	sWpeP+qfoK02Z0xIo7ndpWNfqBL23QhB1kCuw43Tts87ftfM6yM6+z9jsZz13nnFO36ISHoKrAu
	wfxCQjP+YBZCH805C6DwvEIs5RbCm5VK6gFXKC8y6z1IU3u10NLgUOs9Al/3zZ+IkgWHYx50Pmt
	x237RkYxlFB++dpeHWE1rmI8f7Knbgmi152YnJhn5qRj6RwduaKYktu3XguWxTu00dN+
X-Received: by 2002:a05:7301:730c:b0:381:2114:99d0 with SMTP id 5a478bee46e88-38571415bdemr24847731eec.39.1795852919611;
        Sat, 28 Nov 2026 00:01:59 -0800 (PST)
Received: from localhost.localdomain (vmi2317719.contaboserver.net. [84.247.152.64])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386aaae4960sm49394859eec.18.2026.11.28.00.01.53
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 28 Nov 2026 00:01:59 -0800 (PST)
From: Lian Wang <lianux.mm@gmail.com>
To: Chris Li <chrisl@kernel.org>
Cc: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Nhat Pham <nphamcs@gmail.com>,
	Baoquan He <baoquan.he@linux.dev>,
	Barry Song <baohua@kernel.org>,
	Youngjun Park <youngjun.park@lge.com>,
	Kemeng Shi <shikemeng@huaweicloud.com>,
	Kairui Song <kasong@tencent.com>,
	Jihan LIN <linjh22s@gmail.com>,
	Kunwu Chan <kunwu.chan@linux.dev>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH v5 08/19] mm/swap: change back to use each swap device's percpu cluster
Date: Sat, 28 Nov 2026 16:01:06 +0800
Message-ID: <20261128080118.36836-1-lianux.mm@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <CACePvbUtpY=KD8-yMAr4zxHdv7=R=k+y4jVrQ7B5OB8KTG92xw@mail.gmail.com>
References: <cover.1795439990.git.lianux.mm@gmail.com> <8d0a8b9726974ec0dc73d2400f817c9ebe193c47.1795439990.git.lianux.mm@gmail.com> <CACePvbUtpY=KD8-yMAr4zxHdv7=R=k+y4jVrQ7B5OB8KTG92xw@mail.gmail.com>
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

On Thu, 26 Nov 2026 10:28:45 -0800 Chris Li <chrisl@kernel.org> wrote:

> Acked-by: Chris Li <chrisl@kernel.org>

Thanks, Chris. I'll carry your Acked-by in the next revision.

Lian
