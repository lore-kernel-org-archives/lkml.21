Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795709936;
	b=4x1OdkkfEhrTtLIr2PPL2H/TIZHXd+q/QPNsQ7RHTJNV4C7fMCdQNuECz2iVx8WQZ3Nf
	 PnihPIja3oky8i+cRwxG3IhvnJavRzPVrWna+xxeMsSmdNKBeOhW6GswNznhP2gejU6cH
	 aGZSbRadti/GU/OI1Wn0i88gpVPcZeUCtYiP+gc3SK9CME+y7EWvtVOZYJCFh8pmLs6OF
	 fATxjo9RnljttoJ7rHh3aBAAfo1DbrihG+K7XWlySo7Hpzq6g3aLwlHgImsU1YU4P2B1v
	 08EhhK9iH7TnNvUnH85mNTrq873grnuG8TRNwy30HTDBvUCg36NXX2Stik/DMS3/rag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795709936;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-Mailer;
	bh=rtZBeAu55s7ZloA+uxO3vPTR6c/NwsIGOFMs0FGmw6Q=;
	b=O8Ho2oQaT87Ouy0rnxFxWJIydC2dW28Z8t6aObh/Z83K16zx7mOgmIAhom4en00RldJa
	 3s9OkwM54Ls5n7o5RDvFSvnFwQFlCK1oDkvnJEeck6tTRDS5gezU7k0Ix3VP8eSZbayLq
	 hoCE7VYP2QWk0LSOI/Nbq2k6e3ftH/XCVgjN1p8vcK4DuM4e4E+wLj1VdwKco/kgbQ2lj
	 ukxR6pssdDWmT8aFCMmiXvBk3NAtSKY0KBwnGPcRLEs/Px/1EeG0XDGbXuNJo8Pm9+T4I
	 SHR7En9zZ2rfo77ETYOl1saZmquFyJVWBRdSw62cu6SyyJUJwIPsX4tax99ZgccS8xQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernel.dk;
	spf=pass smtp.mailfrom=kernel.dk;
	dkim=pass header.d=kernel.dk header.i=@kernel.dk header.a=rsa-sha256 header.s=google header.b=qxuxe3Q0;
	arc=none smtp.remote-ip=209.85.210.177
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 652B1606A33D
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 16:18:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 652B1606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.dk header.i=@kernel.dk header.a=rsa-sha256 header.s=google header.b=qxuxe3Q0
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-8b32bc605d9so3530068b3a.2
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 08:18:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel.dk; s=google; t=1795709935; x=1796314735; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rtZBeAu55s7ZloA+uxO3vPTR6c/NwsIGOFMs0FGmw6Q=;
        b=qxuxe3Q0W5XXpl0fUvUZLskvRNe9SG5ofEfHdMDb3+R4KITuQjJ0XYanUY9xQ/nQul
         whJS2fIcQz2/4QwDDjbOMiyf/Q3yGe5H1mwdJ97pnfaykqylS40+DYolz5Qy1dnW0sJi
         +PEFJ1Pn3eHnkxQ53h7U9HJdXzh5OWXqOLTFYiPdQsRw7meUS8BS9NcsDNmvWE13L8X0
         4teNlL6KnWoa33dBm73ssubc6KHK7V3ZH3yHz/z02CFt32uQeV1UBl5WLNer/lFfji8y
         1KDJRNBVQ7IuZgsnHz454wS6PdudLpkTabwc9/A35NwoviY8aht5rBRYJ20Xj5sc0L0f
         KBQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795709935; x=1796314735;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rtZBeAu55s7ZloA+uxO3vPTR6c/NwsIGOFMs0FGmw6Q=;
        b=whv73veRim/JjzcL5/haUt4Gy1zGOIZiPDx9FHfFmPdAmpKrl0z6OAmCPzTWF8HJD7
         it61KUQMBaYb8qPLxBD45KS/im3NWyks3UWBJqM4EG1PwsYQr6AsDb/GgD8aKk190Ik+
         iYsEFdkERT+T0LPOzo0ZOA5Xrh0HkuvI2IFbAlrvbT1h+a+xEFad5slwdx9vKpQ6a7uw
         M2nGPCjDGhCYXc7ct5F/71LUGVWJMNGj9ybMV8QWlBy4AyPxKPjaNA8+epN9s96zHaA0
         dpP4znbuuWKYkMlcOPNEsvgtuAk6YnDBniYbv9e2KtXqYpW9HxuY7REJDFojeuihezsk
         F+7Q==
X-Forwarded-Encrypted: i=1; AL+hErFnYUzeJMfKnivM+cXyyDCh8f6FV4CFOpK9RS5WWtHPayOWuUs4jjqfIm9VY0aIqO2kkfmSGQTXX0n0iZY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/iEXen2qwqR6/nXxet90QCJoz+n4AUDLNaLi7+lJT+WqQ1pYrg
	VYJH2gLzBpJF//GNxqqvu18Gr6Q+KlApjKSnQD5eoL93TqN+8hzY6deYiEQDiIe6yt0=
X-Gm-Gg: AZFdTZfHEzz3/oL2+PgJKO++ONWr0EwFJRLmq8AUH0pH7jQMuCsHXWVxAYYpmhrBYeP
	BAsuXlJ3lNPLZoIETtlbsnkeTtoCd/VpR0JQA2nBrPzf3a3PNwcLfuwFQkCiAVd+yAY0bEujgG9
	6xtZRqypw10bRfqZtKZq16a4WO+9e0+rkb47NRWQvQOfoxmt3APYunK6x16RTVeKXhm5vK5a6zb
	47EG/2ioKXpCV54+YrKC8kbQZS3ZKqszauWnqGQpdenDIHvqPf/tIXrJI6KA1uW2hXV//UCrH6I
	XO9W/Fzlv0hvnblByvvbHJ3ifftbJ9bYrWadCsomXRdHRMxwA1QnMWKnJ0z8HRuh2Tg71tpWplv
	I53OfaUcfmjkSTUsshQkcKrFRpBA8PejIX+LRnQidR4TEL2WrXB608+nKQqpYF7NJUGALVNdiG0
	4GhNFW21GyIi9L9jnQZgwB4W1fknTeEGRij7vZ5TXlSHHW/X4dVoY4Jz11901G850FeYyXrpD4y
	QXx/B63i3KQeofrFJHIK417wBukaGDRXWQo3rB2zcBn/LHbSJUqHd5y9dHTa4ZANg5Weu9f2zdh
	LthWDBxhC3mntbAdY2dnN6LCDRTla4grGvABZaAUCfpdKeSK2fdMY0BsrVJ/YzvlkWki10fk5VX
	WMZchGEWLw/N856dq8kTJhqr4nS6WjgPkQ4dbyRBuDKt3U9JkMnD4arHatjeR0AznPPqxVw==
X-Received: by 2002:a05:6a00:1817:b0:8a0:5f63:5521 with SMTP id d2e1a72fcca58-8c8792bef60mr19479396b3a.8.1795709934821;
        Thu, 26 Nov 2026 08:18:54 -0800 (PST)
Received: from [192.168.1.142] ([198.8.77.135])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c87344058bsm10863765b3a.41.2026.11.26.08.18.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 08:18:54 -0800 (PST)
From: Jens Axboe <axboe@kernel.dk>
To: asml.silence@gmail.com, Sechang Lim <rhkrqnwk98@gmail.com>
Cc: io-uring@vger.kernel.org, bpf@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20261119115942.3613868-1-rhkrqnwk98@gmail.com>
References: <20261119115942.3613868-1-rhkrqnwk98@gmail.com>
Subject: Re: [PATCH] io_uring/bpf-ops: validate loop_step before
 registration
Message-Id: <179570993387.7152.8807787806232376566.b4-ty@b4>
Date: Thu, 26 Nov 2026 09:18:53 -0700
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2


On Thu, 19 Nov 2026 11:59:29 +0000, Sechang Lim wrote:
> A struct_ops map with only ring_fd set leaves loop_step NULL. The
> struct_ops update path skips a zero program fd, and bpf_ring_ops does
> not validate the completed value. Without BPF_F_LINK, the update then
> calls bpf_io_reg(), where io_install_bpf() triggers a kernel warning
> before returning -EINVAL. With BPF_F_LINK, the warning occurs when the
> link is created.
> 
> [...]

Applied, thanks!

[1/1] io_uring/bpf-ops: validate loop_step before registration
      commit: ba0084f1402bdf2946282290a3fb0af8f3544759

Best regards,
-- 
Jens Axboe



