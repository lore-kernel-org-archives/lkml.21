Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795657573;
	b=SyNgYPHJDSaFPlWITF62I4YiBYc1pE01DqANfgUqekmMbBTDy4TqTHOSTVyU5JobEF9F
	 2zXQSDmymfJlkvAy18DfwKpATzTDssp/fj7rQWJLNpS6WfD39xFeIPdJ+OWlVPHo61y/N
	 4LCbV61PPxrvqqpoksXfr2VJx9R8EOMEkxL/OnjBCeHK2Fuioz4L1UuwNJmmz2w/GXjro
	 SwlscDPoRj958Vu/BwhAJXtaasz3ZvJGCetLhX50pMj7/QFq4CL9kBO03rONyO+LS2qf0
	 aRJRYNp6VpOXd5M7qN6ZHQFyDXMnuHDyEau1LuNOKDKL1mFg+CmpcMOr4gJ9k2Gdm4A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795657573;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=N3rF56mN2BXOSxSUx9gHKtG6JzkuGpKqR77BvF5Wa5M=;
	b=Gblg0iYyl9VGgolidt1Kavk07mabVMcLmQE/vqGwVvZ8pHm+8A0mJsqlQcUsKVCMfVcE
	 ybJYveqC02isCAEBQb1Jfp6O72iaCinI6T7V1EzfMB/suZzXiHT7NYc2FmXiuvhzBBBZk
	 4kg+LYYoEBf7UAtCyh8GZldSxiYeWRLc+RIfQ0QOnYA8dBCqct35mAU/68zAsxI3O6FZG
	 zYvMbRGY6SvBYNMswMuGEKSTcdUePY3D33MssuDuJYv/m88INySlG2JQ+8MMJoJ2OGG2r
	 vRRfRxkz7kAavS3/rQGYlw8TPbX4QbPnhlaiy8a+LfLvnl+bmtBKVkW6PHXGWgHIRWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FNKdiF5X;
	arc=none smtp.remote-ip=209.85.214.175
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96857606A321
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 01:46:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 96857606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FNKdiF5X
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2f04b676219so36461005ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 17:46:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795657572; x=1796262372; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=N3rF56mN2BXOSxSUx9gHKtG6JzkuGpKqR77BvF5Wa5M=;
        b=FNKdiF5Xoq0hMRcHbu9tH6y/7U3UaSLflUMcWRfFF5fR5BtPAn7FxqZRIBZdvzBcM0
         c+Lmqt5NcwBgOUd8wZx/7HUWiZyU3mStWupqPSs3XWbdanYhferhliEU3bnA2lDeltad
         WmYZEUtE0MNaS0jMSR885BDtoXU/afyRACHGBv62MmMuzYSrGkAZ0/K8RfNhxfmBEzhm
         hQxTVxaHUpX9yVsa8aprILcRiLQIOXaaOumv8EUDOURS5zcVYqfIep38mFQwrrlAg++/
         a2ydaLOpnfPMYDen+RmaUIS5pcyiRgoZrkvDbCY8gZv2NnNADqdi4dZdOo8dI0fxNt6m
         hMnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795657572; x=1796262372;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N3rF56mN2BXOSxSUx9gHKtG6JzkuGpKqR77BvF5Wa5M=;
        b=xJuohQi+Zm+8Gw9lJz9O4H2wr0yXQjsRbFM5ndZFuwMpsWvix9ATpaIGvrJhP64MyG
         /jG/FOyly9zU4bPqHD1LcPXr/cPEz4gAk+aXp2InXooWdJraJuVApviKpm1XD5U0SAJu
         1Rcaq7FDMSAAwiGYlKFPqh9uWaZPX0hZ9uEuB7Y9lrkFI3+Wp/yxQ+qn0CDwyYj81s49
         yvbEJAJXVmqkZPlWldkYXrFRamP8Z7HrpXwHkv/OqRfXzAUjzL/ot9nlLZd1SBn0nBUo
         Z4+WvXrwI6FeYMmtG8u/PxX5iVYqqua3OQ13SCsjOUfSxIu+DgsuYx9m5t6l2ITVnkm8
         vEqg==
X-Forwarded-Encrypted: i=1; AL+hErFdjWriXmbMV0dRICWR6YDyXXtcUrdyxeIcDTK8LPPXjQ7ilqH4GX6dG1tcn8OFYqzVxNNXFOksSMI9QCY=@vger.kernel.org
X-Gm-Message-State: APuU4Z9vqNxjZg2Wnwg3biIubaPhDwGp04qqC6L2lIp8E8e9sVEHJ+l2
	PnQdR0d6DPeHpepuzpakCbUFiFnsST6LnQTl8SanxdWZDzyq/+9BjarF
X-Gm-Gg: AZFdTZcN2iBgzIKeisiSae0HmKqS8wCZMjUAIlEF/Y7Ijj0whiS9EPvBvtwl0z7C0ES
	KlP52517xMkemYGlKbovjfb61rwnRDbcW0z6iKgkat2XOZU47FY38k5xSpjWRew4wCCsr2MWG20
	HFJdFwI+XHHWJSqttrIVnacEq4g015a4e3GhZXNU1ikNyHSrsVr01ezKPmrj64XvpzywHi7DqkZ
	tSFn3kKERuHqDY71Dq3mGaQgp9ZVlNTol1rUdokzJYl0cVD+T+VVGK5pzU1uBKa/FcgkDGgL0LC
	9tZapoXkxdniwjDa9l7tGHJzSkeJDcu2Mlc3PqMtCHGuNwG8ivBxcrB/q/zUTZ6pLt2bUsC9r/g
	sO+EW8xRk0AJKh+1JzjrNnMp87Vy9xkq6DUahRE5yZQC1Qu/oEvTo0JvRz0Un7qRIUU3E+Wykfn
	16mbHVCawe9oDCT33cCCt72Bs/re6L7rG1xUEyBk7iqJftpNy1mwzjEkemMpTLNSF/+p6UFw0Nc
	VxIO+mx1NhSx2uWeb+PmjG6qtbtMa/lE0J75AsCvIP+yokqPfrJLHXUMjLOMurbT+FS5rtzHOSa
	1/AaUgp8DxIBcGwcqNk=
X-Received: by 2002:a17:902:fc85:b0:2f0:3956:99a with SMTP id d9443c01a7336-2f03ef861cemr182916555ad.7.1795657571753;
        Wed, 25 Nov 2026 17:46:11 -0800 (PST)
Received: from localhost ([27.122.242.71])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f15663fsm93505385ad.76.2026.11.25.17.46.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 17:46:11 -0800 (PST)
Date: Thu, 26 Nov 2026 10:46:06 +0900
From: Hyunchul Lee <hyc.lee@gmail.com>
To: shaos <shawnq1@163.com>
Cc: linkinjeon@kernel.org, ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] ntfs: guard the final LZNT1 sub-block header read
Message-ID: <awePXnz3-KU0hCh-@hyunchul-PC02>
References: <179558384099.146091.12975349907127521352@163.com>
 <20261125085004.1816027-1-shawnq1@163.com>
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
In-Reply-To: <20261125085004.1816027-1-shawnq1@163.com>

On Wed, Nov 25, 2026 at 08:50:04AM +0000, shaos wrote:
> The legacy NTFS LZNT1 decompressor reads a 16-bit sub-block header
> before checking that the full header remains in the compression
> buffer. If only one byte remains, the read crosses the end of the
> 64 KiB buffer.
> 
> Return -EOVERFLOW for an incomplete header while preserving successful
> termination when the buffer is exactly exhausted. Validate phrase-token
> length against the sub-block boundary before reading it.
> 
> Tested on x86-64 with QEMU. The original header-boundary reproducer
> and a phrase-token boundary reproducer no longer fault; both malformed
> streams are rejected with -EOVERFLOW. The one-byte control still
> returns byte 'A'.
> 
> Fixes: 1e9ea7e04472 ("Revert "fs: Remove NTFS classic"")
> Signed-off-by: shaos <shawnq1@163.com>

Looks good to me.

Reviewed-by: Hyunchul Lee <hyc.lee@gmail.com>

-- 
Thanks,
Hyunchul
