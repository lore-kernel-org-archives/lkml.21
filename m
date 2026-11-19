Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795102171;
	b=Akdx0TLux69d+GwiYEcw5uNaJkBOtdNkSz/j8iLCJw2N4sZODcEklr6drx0Vp9dcEKxe
	 Ong1FNReEa27McmN7U41o4In6iqDkSpeJQJS8LY9qb6qfo40PcINW4Ob4hLx4Jpx5gxSX
	 zgbb4NxEjrkjoPe8vORAdkcZVFkos9UzCDDMcpCZ7UfNJBtFdMbknmI1VEZ0MA7KpCWd6
	 dfRXcLs7a7pPsQwx04kYQEA3Z3TpTAc7qhuhtXKbkyhWpTGS6ebLsP2l9tigbf5BJXS2L
	 hC36UdzT9tHC0uTIFeH/4XSc/YJL/fg8/YHe+flhdXtr9h6WbiRTebY96CrO2BBbRUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795102171;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=aJBKwBt8iXnZSzkxcMNqzRBSFron06bNz2kQZO6DnuU=;
	b=f4IC2s8DIPRLPmFCv0Koy5asJO46R2k1N9Xotv0OqthRdLUqm4bxopNFiOeNu+Jq53kw
	 rzoLa5ixG1TuCHHceLaZJfvmPtHyT6q4P+lf2MMBMXIrNhnPtgjsPDcxi6uxV+zyzDxTl
	 osmAfdx0DoVwV1BNuPa2rcqeG2Y/ys8kl969uovtFYwvi9GrzPSdLHdRBAYi4N8KGJDlc
	 ECVDVOWzfvf/yEZXDt6VXSnMTmnwje/+BHOx5j1/Gn+g9LoFf1yw344OLu22LzZw7ufGt
	 ceM/OQ8eliuKbeufR9uMeHIdu7pnOaYkmZBNrsWmJAdmMDoJW3I0iecmmrVzXgbt01g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=gsRQY8jG;
	arc=none smtp.remote-ip=209.85.216.52
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FBE2606A326
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 15:29:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3FBE2606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=gsRQY8jG
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3b40470fdd8so362997a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 07:29:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795102170; x=1795706970; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aJBKwBt8iXnZSzkxcMNqzRBSFron06bNz2kQZO6DnuU=;
        b=gsRQY8jG4Jij4ik+prsRTH+CLrrlVHqOXKsdOWeoBXyHCf00hlRP8SUU+0Fl2DyZpl
         C52NdgZ0U8ntHxsOkLcq2J4GfbaeLHIzxu0VaYXel/SDdO+YCxE2q2yEI9g7kX5DLkHd
         lR08nCVSGG3K9VN2h681WANzvCUsA5g0Yc7h/QEa+HpLOM0JxTRpOiLr7Eze50nte8ZV
         rpaZIdaJZdJEXlE0d5f/GgVCJJZlZ1DmGZullQvwSjvhRC9YZMjOjRGFOZVRxeHKB/Pu
         RC8mKho3Ap/L1NRRDLAHBgM/0onIXeSsILJ9pSn6QXOg0g0aoGWaB08OxaFwAqugPxR4
         3Tlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795102170; x=1795706970;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aJBKwBt8iXnZSzkxcMNqzRBSFron06bNz2kQZO6DnuU=;
        b=cgvDCHARt6rj9jK1CD00L1nwmLAq9cEF/SopoPnEh5imaXwRyRhdf6U/WjbTpnhf/Q
         MSD8Y05RR3r+jb9dnV+Xq0ckOXcQe6cd1VLGWKBgS6HnI0R94MUqB3XqtrF+lkljlhoe
         Q7Xg+rmhWLFNDCFuH7gFTHFeXjmStwAmcmO0hG7mR6eK2A27klb/qXo7PFjjz7EOkbVo
         EGUlmjJtNHDAlS8AYLFJcjD/QT5xTgHV8gNiXygre9GmTn4llO3un9xHxb2lb779tYyk
         TnLJZmSQR3eUOg00TnpcWt0sIRPcFykd1zGD/GXejRTY5cQN8pRdVg6ui40GrjX9Mz+Q
         on3A==
X-Forwarded-Encrypted: i=1; AL+hErGPujheKtKDN4CJ6EoQsQf9ayqE4UzqGqirI3o+1gXziQk7bYnMH4HApegEGmFM2cNZ7uW9vhGzEhA3mT0=@vger.kernel.org
X-Gm-Message-State: APuU4Z9V7QM0hlkmfes18e4GrazfYqiEYn78t7zmN0YHH1PlFvKAGk1X
	wper8kW2pdLKue6wv0gSgQSjoG1IyRuyScXmwNSiRQbYZHJeX0iXfUUToPsknYA+g5I=
X-Gm-Gg: AZFdTZdQ/gdKUw3HSc/LOswA0AH0bH2CqXNQmhxze7W1rn6ue6SrhPn2pk4JmKleWhR
	6H7u37YEEhswDs9++ODRrXhw5y8MGHq/p1b5e83q/LNBDu7wSYaJCasK/yqU4m5FpkTTE92x9YD
	iCKWimuacMMUyxRhhrP10yx6oCMhV8t/ESmdHo68X7b3B8gPjqMqpdDDuSbjTs4gc+F98YCV5uk
	Zgc+6ZbV1Zj9ddI7Lp2caLeE11BYS7gycxsvqJZ8jX/KD6T3Fx0mNVKgouckgo5nfhcWFTk7+au
	C3aNxhuUsxDl13rWMqbTW+arlftIUhbJ//wnUF6Oz1ivV1AxXxadI144BYPgYNjXYBv6p4BXr1A
	4i7sXfRHZHFsQztgkh1yhK4KQah57d0ZwkExApe8GyA8VloUX7qNBgBbSKPUSxmBLo6keda3yoA
	LhBZy9E7aKjzGgzlwZsZmdSzeNEwKhCxVdGh5bVjcWdjIpP+w5HSEDg68mWrY7OdiHmPFfctx8T
	soo/SZbvUaI09+/jvadKPbG3Tg1W13iO7XUmmmWXrhK2zvlwyaG8AQc4MJFV0ukuJkRlcJm1KUI
	3GZP8j2VKbDfAOAvXEK6JWp8xcyR9Lqz
X-Received: by 2002:a17:90b:250f:b0:3b4:1336:4f53 with SMTP id 98e67ed59e1d1-3b413365299mr462810a91.1.1795102170322;
        Thu, 19 Nov 2026 07:29:30 -0800 (PST)
Received: from p14s ([2604:3d09:148c:c800:9bd7:226d:1022:f6ef])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b402e75223sm1442633a91.4.2026.11.19.07.29.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 07:29:29 -0800 (PST)
Date: Thu, 19 Nov 2026 09:29:27 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Francesco Valla <francesco@valla.it>,
	openamp-rp@lists.openampproject.org
Cc: Bjorn Andersson <andersson@kernel.org>,
	Tanmay Shah <tanmay.shah@amd.com>,
	Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>,
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] virtio_rpmsg: fix config space alignment
Message-ID: <av8V18TntRP2U6hQ@p14s>
References: <20261101-rpmsg-config-size-v1-1-65686b445b22@valla.it>
 <au4QVFyk7Zzc6y2u@p14s>
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
In-Reply-To: <au4QVFyk7Zzc6y2u@p14s>

[Adding openAMP mailing list]

Heads up OpenAMP people, I will merge this patch in a week.

Thanks,
Mathieu

On Fri, Nov 06, 2026 at 11:37:24AM -0600, Mathieu Poirier wrote:
> On Sun, Nov 01, 2026 at 02:54:03PM +0100, Francesco Valla wrote:
> > The comment for virtio_rpmsg_config says that this structure is
> > naturally aligned to 32 bits, and this is desirable by some
> > architectures that don't get along with unaligned accesses.
> > The content of the structure itself however isn't aligned, and the
> > __packed attribute prevent the compiler to add this alignment.
> > 
> > Fix this by adding a padding byte.
> > 
> > Fixes: ca96ea25e51a ("rpmsg: virtio_rpmsg_bus: Get buffer size from config space")
> > Signed-off-by: Francesco Valla <francesco@valla.it>
> > ---
> > Hello,
> > 
> > unfortunately I missed this when the original patch set was sent, but I
> > think it's worth fixing (or at least discussing) this now before it
> > enters a stable kernel.
> > 
> > The same support in open-amp has already been merged [1], but maybe it
> > can be fixed before the next release there too?
> > 
> > Another, lower-impact solution would be to fix the comment, but that can
> > then led to issues on architectures that does not support unaligned
> > accesses (e.g.: AMR Cortex-M0).
> >
> 
> Thanks for bringing this to my attention.  I agree with this patch.  I will give
> Arnaud a couple of weeks to reply to this email though.
>  
> > Thank you
> > 
> > Francesco
> > 
> > [1] https://github.com/OpenAMP/open-amp/commit/744376f566c3ec7e06a7d093d785295b78aa486f
> > ---
> >  include/linux/rpmsg/virtio_rpmsg.h | 2 ++
> >  1 file changed, 2 insertions(+)
> > 
> > diff --git a/include/linux/rpmsg/virtio_rpmsg.h b/include/linux/rpmsg/virtio_rpmsg.h
> > index 0872cbca4593..d24fedb63023 100644
> > --- a/include/linux/rpmsg/virtio_rpmsg.h
> > +++ b/include/linux/rpmsg/virtio_rpmsg.h
> > @@ -23,6 +23,7 @@
> >   *
> >   * @version:	version of this structure, currently %RPMSG_VDEV_CONFIG_V1.
> >   * @size:	size of this structure in bytes.
> > + * @reserved:	padding, reserved for future usage.
> >   * @txbuf_size:	Tx buf size from remote's view. For Linux this is rx buf size.
> >   * @rxbuf_size:	Rx buf size from remote's view. For Linux this is tx buf size.
> >   *
> > @@ -33,6 +34,7 @@
> >  struct virtio_rpmsg_config {
> >  	u8 version;
> >  	__virtio16 size;
> > +	u8 reserved;
> >  	/* The tx/rx individual buffer size (if VIRTIO_RPMSG_F_BUFSZ) */
> >  	__virtio32 txbuf_size;
> >  	__virtio32 rxbuf_size;
> > 
> > ---
> > base-commit: cbbddb6b08cc9900a87cccaa9b22bbe06aa4f50a
> > change-id: 20261101-rpmsg-config-size-0dbe9ea63c6d
> > 
> > Best regards,
> > --  
> > Francesco Valla <francesco@valla.it>
> > 
