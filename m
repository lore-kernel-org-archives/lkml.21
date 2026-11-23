Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.172
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795426395;
	b=YG9u/Xq1t9KDagYTegG4VsfeAl6KumMwy55zhDHPAm54WZ67CSw2C3hs88jgFKdp+HSp
	 u8/o2P3F6Th6QmcgSPchm19nnZ8azrG3MkepezjOdg8oPiDSlIWTuOvKmDC7HhXFfoLCK
	 P8ejDeuaHoIxd2nQywCKPpM+/Pn4nfu3S6WZvm9JHt0Tkzgtn7dVinm5EJHaIMrExnSlo
	 CS29X80MJkaDi+TphakYq9LlfRwbb1suQj+BgAqJd7GeS0hR/OXu+T1YQ3IyzQ8H2x+cU
	 pugtB3DGRKB8cudru0RnNQDwyMB5dTsTV1F6gJS0BxOjxEcjgxAimWx5GQNnVo9ds/Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795426395;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=rEQwJ8ittw+kMTmn3OLooj/VNGKrQlM0GiJz9PEPOrE=;
	b=NrTUywVNVo9PB2PrLZG/0nl+CPKDMaToVQlR0Y6W8q/aOknBCutNlhfbJV8zm3z3duVn
	 2BNngC4Goqnwce3u6M9cp7PNMmPaQ5aZen+1I/qziAWStFFBWxg2ZGz0HkPNjQE8Nl/eC
	 5hUNE9TF7SZnUP1YpNSN51cCp83bIKSgVPJmYouMy47npd46pFgtbO3jM8GC3Uvseu/tL
	 S5Nftw8fGDHYmyiyhev6Gns+Z/AIXoNa12VPOT/fLH4gbwssKQrngtO0u58K8JemMZT8o
	 r4+7C0Zcok7yFQN87ZNaEwpBrJ5nQpRbjScjf4E8P57GXCX5ZkF0x7KAAk9zqxlR7MQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=LXj3nhiq;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.172
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AB30606A331
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 09:33:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3AB30606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=LXj3nhiq
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2e9ae391a05so20194645ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 01:33:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795426394; cv=none;
        d=google.com; s=arc-20260327;
        b=lhRBFhh/nVt3etXWXrQMVBDtq5NBrBwuGBxuKsE3e+iYWnfaZCVEkAvy+UyFZdUqVo
         952BDxiVTgtFm7VsuKKGpXgzRUvg8vwjDPvbsDTkhDZqXnLKkO976KcVaGFPe9j4BMYm
         hweWgQgQhEvlZCagV51yep5vszpTs10noxFSzUycm+WboNYRgP7F9BhPciNxuSWC2eYp
         K6WesHuHi0TQksWkL+iyqEiz+hUO6eSDXaINHLv6iEYL1vzZC5EQkeevyXKpmoN2K+UP
         3Pk6GlUPUabpHMetKOLDpiHl7nUNgHUzY9GqcCKzEay7z/zCwynRCcxY/P/BuLd5nRkN
         oUNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rEQwJ8ittw+kMTmn3OLooj/VNGKrQlM0GiJz9PEPOrE=;
        fh=9HSaBUXno8dBUqHWKDo1Z4GM19V0CdN5tzG5oGND6u4=;
        b=I1Xzatg9Erd1tpL9F5WBCAQBGhWIv4diVSxquh3jQ65Lmzw5Zy0GWQiLB7JE3CG3Y/
         gOU0eWNSphlYm1ncTwkmXWZHjLykwHHC0Z1F9so7dbsSp6BF4qsikCwGw7Db1RnN00GD
         nZYDKf/D9O26pS2nigML8OnfPVti35O78YEyAk7UzaVS+5z3JO0cTtJYMiPHb8v67MC+
         piHSFqWi62LGMZcFJLk7TY43bG+qiakjB+QuqQRJd5KpLaWJP7iD0PUBU0EsIu/vzA0E
         63E2c3Ix1ODGjgSfnDKUrzZErpWAkQqQwKRH5e15woKs5oFHSLO1F25LHDSQlnww2iMw
         HxKg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795426394; x=1796031194; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rEQwJ8ittw+kMTmn3OLooj/VNGKrQlM0GiJz9PEPOrE=;
        b=LXj3nhiqV2kbKq2JZYqo80CImn5UQl/GyJGDcm9FuPHx5dEG6XfT5QnS5ojom5OAPM
         IVr0OpPEPSVKwGcHptDgP2hgQT761eogItWV16wFBjkWc0VK/I51vre5G7/yf4bErS7L
         HXOhyjmxN4u6LTetunZ7WdZnVU6MVSaGXD6c8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795426394; x=1796031194;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rEQwJ8ittw+kMTmn3OLooj/VNGKrQlM0GiJz9PEPOrE=;
        b=TcrKslgRYnm+owJ+/vO+4Bev26K4XB24D9nPpHZNciIubS7WfbkVBZHgcbrSPq2vgS
         ilt5kVfw0Ul2JOZ/WOupR8hckw1vGJtgZeHqci2gieW4XFYtoh56XIPJxGHWv6oQuGv+
         fyx/Ay4E8eVd48acsKbd835ifIgt4NwJ+McO9yimjyCWWlpl2GCzI3y90amXkjBklyIX
         TGh2ra6VkAK7Vzpzh4aT1ae5j55nwJNL4tP9o54jOwZ5cyguyrD09AOGtRzRaAexXLct
         UVXhSD4cWC1mf6JHUPZ/dYE5jJLtuepxaE3LeDl+HapRHWG+m3CFZk/LXn8bXMzBLeWL
         SmoQ==
X-Forwarded-Encrypted: i=1; AL+hErFKKanMswwuQeyrEHgo/k/RGnJx7cwT/nnUVTd3FJB1eiMxlZqewTMoljpoivr7Tgk+9sUdH771ENnhBro=@vger.kernel.org
X-Gm-Message-State: APuU4Z8AK2Qj4IB9d3utGC30hF1ib8ps2ZOXm9/jUa6rNcDRwiLLVF38
	PtYGoDNS3dtK8vMuFcxnXl4C+Y29ULVypo1XNva0qcF7PNOONMEMAQu6490sghlUIME+wdLO7tI
	J4MU7mlD+K9fbdxZwvmn8zHRg9J0uK6EcbmpwkeEY
X-Gm-Gg: AZFdTZeYa4j5SEehfpwO4N9PmcxxuSJLatFNz8tUmGGAZf41zAT0UyChg1MqUiKMDrw
	GeemjWZ6+IGDdz3Zi/gV9OJN0qPh6535Y61nCHPOTMWGx93AGnvGTAg7l4TlbzZEbpjU3v8/vqI
	IdTYG9fVS0kpEfPBCvjiOyMcOSKZT7HdcbWF4S+zKxwucissDAqz6kqH1LqM/g7Ko13z3rpM4oD
	Rd5GgqJA5faQJ7911WWH24Ol5DyofTB2RqTcBWaE/ypPmNLBQzB+i4H5ZauXmndlTZ5viRNdYId
	yQ2DgNb1PDs3XZ/CmFaH8M3tKGUaXH5hkJ1ogk6zPz4Lea25QzGZH9mhJ5ITg0k/A7snaWKPWRJ
	imJExyLgfYUi2WVVI+y4n6DvkhaoR2xCfuefCwirAvVo9zkAaaTl+nEdStt/lwXIHW5Y=
X-Received: by 2002:a17:903:1c9:b0:2e2:d3ef:125 with SMTP id
 d9443c01a7336-2f03efa3ce4mr74174785ad.5.1795426394589; Mon, 23 Nov 2026
 01:33:14 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261018023438.3902617-1-mhun512@gmail.com> <CAMMMRMcBT1TgmOYyYO8dJsLsdzqBiyUU4=S7XzE2zhYh_hpP_A@mail.gmail.com>
In-Reply-To: <CAMMMRMcBT1TgmOYyYO8dJsLsdzqBiyUU4=S7XzE2zhYh_hpP_A@mail.gmail.com>
From: Andrei Kuchynski <akuchynski@chromium.org>
Date: Mon, 23 Nov 2026 10:33:03 +0100
X-Gm-Features: Aa3M54pgTzsRiadjShSiXZDHYLQMr5Bhj_1HMO-qoyOLiBI_ZI7BFiyHNfSFFtg
Message-ID: <CAMMMRMeA76TfQnCJN66K6+VtNGE5YG1cNi-TcVhrEJpdT9EdnA@mail.gmail.com>
Subject: Re: [PATCH v3] platform/chrome: cros_ec_typec: Stop altmode work
 during partner removal
To: Myeonghun Pak <mhun512@gmail.com>
Cc: Benson Leung <bleung@chromium.org>, 
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>, Jameson Thies <jthies@google.com>, 
	Tzung-Bi Shih <tzungbi@kernel.org>, Guenter Roeck <groeck@chromium.org>, 
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org, Ijae Kim <ae878000@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 20, 2026 at 10:21=E2=80=AFAM Andrei Kuchynski
<akuchynski@chromium.org> wrote:
>
> On Sun, Oct 18, 2026 at 4:34=E2=80=AFAM Myeonghun Pak <mhun512@gmail.com>=
 wrote:
> >
> > DisplayPort and Thunderbolt port altmodes queue work to deliver VDM
> > responses to partner drivers. Partner altmode unregistration does not
> > drain this work, so it can run while the partner driver is being remove=
d
> > and access released driver data.
> >
> > Look up the corresponding port altmode with typec_altmode_get_partner()
> > and disable its work before unregistering the partner altmode. Keep the
> > work disabled while the partner driver is removed, then clear pending
> > response and DP status state before re-enabling it for a new connection=
.
> > Use the same cleanup when list-node allocation fails after registering
> > an altmode.
> >
> > This issue was identified as part of our ongoing research while
> > reviewing kernel code.
> >
> > Fixes: dbb3fc0ffa95 ("platform/chrome: cros_ec_typec: Displayport suppo=
rt")
> > Cc: stable@vger.kernel.org
> > Assisted-by: LLM
> > Co-developed-by: Ijae Kim <ae878000@gmail.com>
> > Signed-off-by: Ijae Kim <ae878000@gmail.com>
> > Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
>
> Tested-by: Andrei Kuchynski <akuchynski@chromium.org>
> ---
> > +void cros_typec_enable_altmode(const struct typec_altmode *alt, bool e=
nable)
> > +{
> > +       struct cros_typec_altmode_data *adata =3D dev_get_drvdata(&alt-=
>dev);
> > +       struct cros_typec_dp_data *dp_data;
> > +
> > +       /* An altmode without its optional implementation has no work. =
*/
> > +       if (!adata)
> > +               return;
> > +
> > +       if (!enable) {
> > +               disable_work_sync(&adata->work);
> > +               return;
> > +       }
> > +
> > +       mutex_lock(&adata->lock);
>
> That won't be necessary, as there is no activity at the moment.

Hi Myeonghun,

Could you please send V4 without `mutex_lock`?

Thanks,
Andrei
