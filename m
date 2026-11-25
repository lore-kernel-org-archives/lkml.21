Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795616973;
	b=kGN2sS3WWSR5dQsKg8bddseAiASMFvR1p0MzCm+nFs2TpTU+8Z1lqKjFDNgKhV2T8VWA
	 7zC7DC3Ww39T6ltun/EYAYTOL/biAPp23jbLXucm6zSacJOiKIPSeTCZbXqbPoqFgOFc5
	 1Rm+MdXCNGbwShOlw/tQIEKwG7KZjN4fmrrVzTT0UOdo/caX4sNr/VA4dFlKaLQE6yc1E
	 KTFhx3O34Awvjo/qt0sPOzjH1IVE1GYPF2cigPUMY6koI3cnjWzFa1357wMU5uESZnHu7
	 DNUwsa2aLYYtC+F1FqZlUkt9n+7laoDlDyiTuCf+dsFmMVfd3tWfanTIzk/THGeQK3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795616973;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=dEHXRV7HnjpoU5kgdWl9W00WxAauTcUpdR8PSPPyM+k=;
	b=cExgN/D4G6A//+SfaKclEjl83E760AQDg5HBWhQDEFpG8R4tDL4qKfm+9icj7I3yIXi6
	 KGbfEjVUYlcfQWe18P8CiCGkpwZMCssZtx2rNbnH7B7wa3+kXkzAz1s4wW44pfUyqkuER
	 PmL6hA8N/avQ9U43HOzejMctocrs18amISq8xLsyCfgCiSqdqvpmMxWstqer48IPigA9+
	 u1RxGb92T/acF2E+s/M5fU9y2kLW92gon2rhgOQ4cmBwKL6pOBLesrXx4+T1jbi17Awbt
	 FTTu7UsMyb7d+I6SaysPwwpT0/Y/7RBnYLPNoT4r9oW6qHB8zXN7llbXUnqdHYh/mYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rowland.harvard.edu;
	spf=fail smtp.mailfrom=g.harvard.edu;
	dkim=pass header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b="I/CRJsy3";
	arc=none smtp.remote-ip=209.85.160.182
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A057606A326
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 14:29:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6A057606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=I/CRJsy3
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-55d2d380f6aso63866041cf.2
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 06:29:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1795616972; x=1796221772; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dEHXRV7HnjpoU5kgdWl9W00WxAauTcUpdR8PSPPyM+k=;
        b=I/CRJsy3JkFBB673pO40I8toSCzCOZZynydAyaYcvjp35MHkvgnmTcJd2l9wyBhBNy
         C/Lf/4dVPIUHFxyVtKBUsqBGMHrWgaq5TS1TesIGZQRu7bA9FKPHjVWvh0ikBmhI9p9w
         Difkmhn8r5VeeLmlrO8fVTzmJzscIdD3XsiZ9CFtXLKzRUlEO5esYgZmfy2PxkETkkde
         NR5L55W2qqVTAajNsM9bBy88Z7dsQGgHpb/VxH18luo81vD7S5Uw+Fp9P//La+QWAnTN
         7zIXIX30gS/mvO9zaRdURiQz7Wj02q6h0SwAlVye4xOjgkQc0tlthUXKAoOEcLU0vHgT
         oxZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795616972; x=1796221772;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dEHXRV7HnjpoU5kgdWl9W00WxAauTcUpdR8PSPPyM+k=;
        b=cbBNYTfhGXIymW1DzwaDUUP/9xN5Y45X1Wa0x1IfW3THIq1nWbdwvgLCD9caN/nHVW
         Zy6uc+GPV4mMKwfYJx+0WOK40AKa8Riz6eBNnN141hJEmBxvvNrURVHDyAKI4iSUTft6
         H41SLpOJxqyVPNnSqsyIHsi/ATOCaCbXLLiDbW1WuPty+GSKCbMiZ4wYLgCTBQfCLP43
         O+6FtScBPhPzjbCcbKiPKF8cGlQm3p69zg8FQBBVrnC1Wxt9yHUdx5u1AWk5jFjVuUrA
         jl9vnaN3QbnYNRfpjsuUu5Ag2dGcdXRJbRorGUkdCNDGX4UsNCH+ZIArtfDqLvsdll+U
         8G9g==
X-Forwarded-Encrypted: i=1; AL+hErFqAb5CjJ8cDdwleoa7yAIqqPEpz/0JWfiVYNQyT0mo4lZTPdpTcl08PPfOlkowyhR+ggLFVA9crrB3vIM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/B/m4B/rKyIWFRdTP1gI2cIeBA9WYK/9Fu8AktfAj8epfSPpYT
	Dphyn7pRTwXLe5hGCP81sGD5t6AfvEH+vvI1/dnRPLOW4PFBCm7mEv43OTBW6GGJfA==
X-Gm-Gg: AZFdTZeLKkgPTZG/cnCvlDNiiPCaYQpbPufxXLbdgVDzQtvQDgxrehHM/lXLPm+wnjS
	kdrc3NcLNwzqsaHkg0XhmkNaWECfzFYw+oFdr6ciEXdh6Zwf4xAagrr+23NsOjnOOcqndRJ2qyI
	mAxQoAdTn5+sWwVect7uQZ/NAszbXC3xn682fSZE2O/+m2RjOuT4pQCt7kgSa0zfPF1Ek5BozY2
	w2RUqKzjToutKDf70f+xm6BoF3c/bBAR6HrnPwhxLRLM7NqPcEBrjJ0H8xbcxUl8CuqM0sxX2IV
	WFgUQ9PR4M/tTpZbUYRt523KmDadwiaBeU+c1BXFdSaPlcozVvqjBAvqyb1ILgJUM2rpc6lf6yd
	NB5gdOuSlbmY/fUt6s3W5+jEuFkouQ/0jXtuMnQsSMExGn1G5pUzE0Z3E/2+NQ9JS/XjhyTaNbV
	SZHd65HXpolt80g5V5Tc/1LNBCZ2IHz0ApMqSzRLkeTYH1Cna16tg0VH39Ws9oPI1MMKDdnfyZr
	YAIjHKR4OnKWbe/c+qPj356zbHTE3jFjqIGKwj8vABaW9BcHtH50xaqrNInw+MFnnw8E/PTOqv2
	qU/VUqpaaq1tj27FaQdRxuoXgJbfQg==
X-Received: by 2002:a05:622a:2512:b0:55b:f867:6f4e with SMTP id d75a77b69052e-55d768a4856mr348057771cf.5.1795616972270;
        Wed, 25 Nov 2026 06:29:32 -0800 (PST)
Received: from rowland.harvard.edu ([2601:19b:d00:161a::9a34])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d7882e2c6sm159050181cf.12.2026.11.25.06.29.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 06:29:31 -0800 (PST)
Date: Wed, 25 Nov 2026 09:29:28 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Michal Pecio <michal.pecio@gmail.com>
Cc: Kuangyi Chiang <ki.chiang65@gmail.com>, mathias.nyman@intel.com,
	gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND] xhci: Handle missing USB2 resume events on Etron
 hosts
Message-ID: <c5649772-9fb3-4644-a08b-bb165f0173ef@rowland.harvard.edu>
References: <20261123072320.5967-1-ki.chiang65@gmail.com>
 <20261123122343.6d3f8866.michal.pecio@gmail.com>
 <CAHN5xi2dFo2NFbMb8t_5uugX56Fq2=Jj3G2_5xA0-b_NTjQsSg@mail.gmail.com>
 <20261125120545.76f07ed8.michal.pecio@gmail.com>
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
In-Reply-To: <20261125120545.76f07ed8.michal.pecio@gmail.com>

On Wed, Nov 25, 2026 at 12:05:45PM +0100, Michal Pecio wrote:
> On Wed, 25 Nov 2026 09:33:38 +0800, Kuangyi Chiang wrote:
> > I tested again on an EJ188 with three USB2 hubs connected, without the
> > proposed fix but with extra local debug messages to detect ports that
> > are in the resume state without a Port Status Change Event.
> > 
> > When I connected the first mouse to hub 3, I saw the same behavior as
> > in your test: the USB core checked all root hub ports, and all three
> > hubs completed resume (evt 000e).
> > 
> > However, when I connected a second mouse to hub 2, the root hub was
> > already active. Port 1 also entered the resume state without an event,
> > but only port 2 was reported in the status bitmap (evt 0004).
> 
> OK, so I'm not sure how you reproduced this problem on the two-port
> chip, and commit message was wrong - the root hub must be awake.
> 
> But now, if I disable root hub autosuspend (echo on > power/control),
> connect two devices which use autosuspend and remote wake one device,
> the RH wakes both ports and only generates one Port Status Change. It
> seems nobody expects the other port to be affected so it stays stuck
> in the Resume state (SW is responsible for transition to U0).
> 
> I don't see similar behavior in other xHCI root hubs, nor in a few
> external hubs. Anyone knows if this violates the USB2 spec?

Yes, it does.

Alan Stern
