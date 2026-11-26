Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795699916;
	b=1UYEKDmt6meMrr5Rd/pQgg5touu3Jp5nzH5SBegjhzQ6vii1j907hD0B1c9ryn9UkAqy
	 48ciNUfwzXfujgWcjbOaOdGVf8sCp/7E1wgK1w5E0OT8uBiFaJ4MX+n435fLA9FDdo34e
	 IxmF1JgI8h6CJUJ4Y8BKqSQdCsPQsdCXaP+nvWybyTq+dT6iniF64kcyUofejLWDIlncz
	 S1Jha5lV3f9VJ1aRCMO19diN9wqvoIMlQwzHkWKtah0RQSVhP3SFhT/2l2lFfhu884u+x
	 JDwePWbCCBfxPnFBRMp1MSeYHucMkyRc1D8u6qmVmL2mFcag0/69zUso7ItgqrCmvHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795699916;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Subject:From:To:Cc:Date:In-Reply-To:
	 References:Content-Type:Content-Transfer-Encoding:User-Agent:
	 MIME-Version;
	bh=3B43kyyzUUTLVNXK4AN+mljA56km2Ewzy7V4dK6lZDs=;
	b=JjL7gfNY+pFFbk8jGqd3LSOGnDsCJ+H9fpPW34z31aDVhuAgs02Tj+FIbpvEaqpgTTaI
	 XonVCsQT8WD9gTwzT2N2Snxv2hB51nAXqvS7dTvIYt+kVlBnA0dltqlEqKZjqvKmIcEXH
	 +5br8lk8SH6gksLvwQDcSHZs7geg9Me0LovKBjCIaGEzqKpzjrsnbLPsRnHM9o9rkIvWc
	 nlyZrZnv4TsezjEDUKENXp6e2aWiUfO3mCf9LhaaVUhEdw+KuELpI+OmEjpz5DJetypIE
	 Swj5tyhqvkWNfM2NzupdmafMYZ93UyG7NxtYT/mh2FudiBPmLJyBj9gtNGn9QKit1pA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=f7EDdOir;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=AihzOTLr;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38ED2606A323
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 13:31:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 38ED2606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=f7EDdOir;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=AihzOTLr
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795699915;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3B43kyyzUUTLVNXK4AN+mljA56km2Ewzy7V4dK6lZDs=;
	b=f7EDdOirMWXC8akAqM9hNUNbt67exkg4w3GR3ZxjimjvLhVh0pYAcCTqRTE+ih/EONmbc2
	LWmfgyO226ldZNKYd4m8ksWnOlp37kk8jH6L1AezJHweNA1QH9uegt6DCeg4hLebfG0jyB
	ON/7vw0OJJKYkKFRXFjRMVTsQGz8zQI=
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com
 [209.85.221.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-52-kO4doS7rOS68I2o9Z8tXDg-1; Thu, 26 Nov 2026 13:31:53 +0000
X-MC-Unique: kO4doS7rOS68I2o9Z8tXDg-1
X-Mimecast-MFC-AGG-ID: kO4doS7rOS68I2o9Z8tXDg_1795699913
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5eac42e83e0so1224152e0c.2
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 05:31:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795699912; x=1796304712; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=3B43kyyzUUTLVNXK4AN+mljA56km2Ewzy7V4dK6lZDs=;
        b=AihzOTLrQh899jzjsPKX75h0dSdvMcPhoCbb8JTgf38hLo7r2lv1dOELdPwaOHzcPk
         dzPKj4TlF+KHZ5Kw2XItc1tVbO+fDv4UqE3DuRHS6NcNChxPPNs/lByzDq4CaFGNzAt9
         0YASKrtU0ycops1hL65mt+9Wu+MghYJWw720J9H3PbOQGZdaw4tydD2ZrVuVmmwS+guI
         wBMFkZYJEXMoheJHDqvlRhOcE0bJkEUbpW+Igty9dibVhXLc0ucTBjlxJYYLPE8i2gLM
         hRNk+Vv5uiqz/dS7qci8u4jCaPE/jd5dY7L6mo6auwhf1paAXQwO53zDcNr1nM9orebe
         jQww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795699912; x=1796304712;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3B43kyyzUUTLVNXK4AN+mljA56km2Ewzy7V4dK6lZDs=;
        b=yoOptf+kL0sUcTTL9CxmrzpYCFUNtJ7UtV2MvHoNbG0iuQwzDBzbPi2mfv0X6VUy1T
         PmCx+YJe58sMR9b2GyXzfs41qAgjukm7XvXzbxJNqEnomQGcXvUcdkRWRDHwHuzzitwj
         jfZVcXpEAfdq7TOMl8Jp+Eoa5MQkukhGCsKiOR7+nLtAlaIbTyu1tThWXe0OZF/pPuY5
         FxpMwm3PBPeioOpv7F1SttFmFZXFQIQ2LFf5EXm5ohHGCJxh1nWtoYYdiY+QbkTL5LQY
         7hLEtHDlYuzsyUOU7RtJnmx6eBzDGm/N5zrSesTxIN3y2p/ICmI4O0b+muoknfS8pc7k
         HjBA==
X-Forwarded-Encrypted: i=1; AL+hErGzkDFx4Hgdd7ozX/7q8AWBzFcMtt0EL86EuSMkOGJwQv4cNWMr+j3JqtG8bTMuWakedJFT1htk/xhW/ho=@vger.kernel.org
X-Gm-Message-State: APuU4Z9JKv4bYKUyDfDKJlSfpBKaxJU9NuVV7LiYrs+cu0cWb7h6Kgqs
	8j0fltofWeXLG2PKbpPWYuANiX58oNl7CzVWGCbh2x2fOVJJB8NPLXNL8Lcl+cRnhLGYK+AGw90
	fZfuxGnsYZjj9+zFlUo4l5W+xNEYIE02zfrWT7cWUpV2qWP3X7ljCN9OFcu3a1MB3ag==
X-Gm-Gg: AZFdTZemaMAu9Ur7PQgvOsR/vCgHdxKZa3LcUZnCiz9BZiuDpuMmdoNcUNmGcdH9WDE
	1IPrkpQZ2Gh+aBc7LdopO40cjUju+yn+t2Zu8rviRBkh58u7A+FG/1VgbP+NwNuCAbBumyiEJ91
	8ltmSBOw867T7v/xUfhNFMrC0OHXSjrlj9xMNFSXClRxG9Cld0RjrAUXlIXjnbzKnmGXWLBAnVG
	w5vyAA5/qxiEnowP7MZ27hMQIU3yAAhPmd4rzCCNRPUI8n6YSOpqoPTFf2u5z0MYy0aD6BrjH9g
	dC4a3BOpoUfoAiPd1SN2nW3CbP0UTgWWYykkBWPIqcMLpzWu7e2mhhaa7adJ1OnWfig4gLseOUD
	CLBbcJ9okYxLt7t8dFxppLUmS11IUP3LIDMgSAEHn+HSogODWeXGxV5hyd/eCjKHstk6nI5lths
	qJIfBbDkY9gUkTtE5hlYlv0nfdIXeVoMFzyf1LBgWevnhkMqbORVSihMmDFAnLXtsrySnbig==
X-Received: by 2002:a05:6122:29cd:b0:5ec:d751:a18e with SMTP id 71dfb90a1353d-5ee8af5d5c6mr11288512e0c.19.1795699911833;
        Thu, 26 Nov 2026 05:31:51 -0800 (PST)
X-Received: by 2002:a05:6122:29cd:b0:5ec:d751:a18e with SMTP id 71dfb90a1353d-5ee8af5d5c6mr11288267e0c.19.1795699910439;
        Thu, 26 Nov 2026 05:31:50 -0800 (PST)
Received: from loberman-thinkpadp1gen5.rmtusma.csb ([2600:6c65:2440:d8c:929c:b769:6def:faa3])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d788506b0sm180018331cf.17.2026.11.26.05.31.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 05:31:49 -0800 (PST)
Message-ID: <f323c3d62265dfe90fa71514028af4d35f6e2420.camel@redhat.com>
Subject: Re: [REGRESSION] DMAR fault by Intel H97 SATA controller since
 "block: Increase BLK_DEF_MAX_SECTORS_CAP" (6.17-rc1)
From: Laurence Oberman <loberman@redhat.com>
To: Bart Van Assche <bvanassche@acm.org>, Lu Baolu
 <baolu.lu@linux.intel.com>,  Jason Gunthorpe	 <jgg@ziepe.ca>, Joerg Roedel
 <joro@8bytes.org>
Cc: 70sp <70sp@protonmail.com>, Thorsten Leemhuis
 <regressions@leemhuis.info>,  Tobias Laas <tobias.laas@posteo.de>, Damien
 Le Moal <dlemoal@kernel.org>, Jens Axboe <axboe@kernel.dk>, 
	regressions@lists.linux.dev, linux-block@vger.kernel.org, 
	linux-ide@vger.kernel.org, iommu@lists.linux.dev,
 linux-kernel@vger.kernel.org,  David Woodhouse <dwmw2@infradead.org>, Will
 Deacon <will@kernel.org>, Niklas Cassel <cassel@kernel.org>
Date: Thu, 26 Nov 2026 08:31:48 -0500
In-Reply-To: <0edb9525-5068-42e6-b6c3-a1dcebcbcea7@acm.org>
References: <5ad27a97aafbc08a8702d5b90d09cd59@posteo.de>
	 <awSs5Cw3hFkf4O4T@ryzen>
	 <ec36d13e-e4c2-4bfb-8b50-69d4a1628839@leemhuis.info>
	 <87b1bbd8-8113-4890-8623-738b19a9cc7b@leemhuis.info>
	 <a0ff3156-add0-4f7d-8373-09f95bd7036b@acm.org>
	 <2adaf0ef9e1a2fa18590f7d8dbf203c0f7de2be7.camel@redhat.com>
	 <uJluFNYGCCrdvnYT3MatN_4Om8UczTJX_dzxumJxyCAC7F-Ubrekb7LPwlRxhCW0J91UBf-TqeRoJQfgYIYBRvMsPmE-Qs1eAg5zbDP0s58=@protonmail.com>
	 <0edb9525-5068-42e6-b6c3-a1dcebcbcea7@acm.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 (3.60.2-3.fc44) 
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Wed, 2026-11-25 at 15:27 -0800, Bart Van Assche wrote:
> On 11/25/26 2:51 PM, 70sp wrote:
> > as I mentioned in the referenced regression thread I reported, the
> > patch I sent out was basically an example to show that it works for
> > my use case. I wrote that I don't think the patch is ideal (in
> > fact,
> > I think it's an absolutely terrible solution to fix this). This is
> > also the reason, why I just sent it as a snippet of code.
> >=20
> > Please take a look at the code before the regression started to
> > occur. It was implemented universally. These vibe coded patches are
> > horrible compared to the original code. We are literally making an
> > exemption for a specific CPU in a place where it shouldn't be. The
> > actual correct solution would be to make a patch which works
> > similarly to the pre-regression state.
> >=20
> > If we are going to merge something that is made by a LLM we should
> > at least make it good. Ideally made by an actual human.
> (+Lu, Jason and Joerg, signers/reviewers of the patch mentioned in
> the
> Fixes: tag)
>=20
> Is a better solution possible than the patch "iommu/vt-d: Disable
> superpages on Haswell with integrated graphics" I posted here:
> https://lore.kernel.org/linux-block/uJluFNYGCCrdvnYT3MatN_4Om8UczTJX_dzxu=
mJxyCAC7F-Ubrekb7LPwlRxhCW0J91UBf-TqeRoJQfgYIYBRvMsPmE-Qs1eAg5zbDP0s58=3D@p=
rotonmail.com/T/#mc147f250c5356e3742ab3d30ccf6b4a3a8c4196b
> =C2=A0
> ?
>=20
> Thanks,
>=20
> Bart.

@Simon,
To be clear, What I tested was the patch Bart suggested. Not your
original suggestion. We will still need a test from Tobias to make
sure.

Thanks
Laurence
