Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795116728;
	b=UPZQF7O7WTBRUJCwYG6bKbFz746APxawJ/75VJYa+jVwO916GLUM6Nx/kF+2GamLylUg
	 QAEanwsVCZ4pT1/4xP+f02X6WsH28O4ZIEkO6wCrA6KOwL872o5wM2mafUpUbIujgkdVc
	 LlhHT02XWjzQCxXtxsZIg3ALJDKhMh/VNXV0lSvow3dr2v9v68fDf3ylgWvfNCm9GJMda
	 i7ioeqnLMoWxulnCOaDJRsPSNNrNppL9qwKxo7CoXR9fSoCweknbNG0/G0PzkshpPoDb/
	 Vy4cXI6NPrpVOyTZe8xNVM28ZuNA1CogGk77Yn9cgnQw2MKKhAxfHXxsAPYxdsBqV0A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795116728;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=zHELh1wvQ9nrwWZUArifTWwLGXrX5lfqWf4Gv/ulNME=;
	b=VQ9N0OkQhoI64Rui9BW3eDKkgc5X5rFcQOYnsuzwdwa0tW9xblTdsx93Q9Wav266C4Yh
	 TaoszTOovLTjMJqMZXwg5wT6QGCISiXf7UbukeklC6FDFRFXkRla4T5mtLNAuk2cbfMEW
	 S82VYoenjpSNdsxSAVcfDCmH181Z1SH84C0hjP8YebsC9wG/ZW1OnlVfOfXAXnvwsCnmg
	 omdxoxFUJMZjBwUno+mB7PlJhlYsjJrUkZzQoB4svl5YFj5X7t/3PSMzWuDtp92fx2i7o
	 /Sk5VLdBlz/Pf7WpoobZJGjK8aag0qyBRGKXHfKxIvT5Oo3CqGyaQ3JI+y0nf4fRx6g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gf8E0pgs;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31D37606A324
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 19:32:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 31D37606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gf8E0pgs
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-492690dd5daso52701f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 11:32:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795116726; cv=none;
        d=google.com; s=arc-20260327;
        b=DH7VyS8mB0znLcT9lPcA0Mh5vG/04xUVhbbLk8AsPoswHEKbUyjRxIV+YGpp37u026
         3hAJnV7ioRfxCrYAn4/V/vtbOIFf+Xk3NxSQRbksKobgBEdR6f9OW7tdHgUbpCtVwXjP
         Fqqrr2ivIAfExF2VenEM6TE2ouGxYeXTYZD0JKYldVc6B2Ni2m34ch/ikCH3lsuqWZu0
         qHkqZAZAyzLiTNFHl3x2Ba/nG/VejfgVe59B38LfFaL8TSKm91hksbPqvmDr1ZzY1NaQ
         yUptVIHRW8YnVDpw8ikVZXzlx2kp2Ond+BpCSSEBIalpSo+VGViYn1UnQA/mmen7LqvH
         cWEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zHELh1wvQ9nrwWZUArifTWwLGXrX5lfqWf4Gv/ulNME=;
        fh=ED90tbICu6qeot8y+QPTbFRNGnSR6bCqkBwoIodAE8o=;
        b=jIKOH8nAZAXZV/ss12ZQUPyOe2DcJSEXtamduYdyidxc1FW8LETaEoHcY12+zd2c9w
         jR4LsI4NwyNIXQzXvKdvPkhpjbrds7x7VpapOxV3+pFl2d0jWCVJXrQ3j2oImWlzRBBV
         iohoEq/6AmRhBeR+c3Va5JyUqNvNXVGmvlxRJkuNtvGCtsY55NGgYz51DUmsn2G88yI5
         bHtvIL0ULMHRp2n8taaLR13vkzXh4NFaswahKzrEkRSU+49XuVf3tFWjIWRVASYIOhMA
         Bzsxu6/xYNXiPZvRfZYSC5kJuiZSuMNcIcMuwrb0CIwWAkY7LzYRwIXPbqZGyCHmCaJJ
         04SA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795116726; x=1795721526; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zHELh1wvQ9nrwWZUArifTWwLGXrX5lfqWf4Gv/ulNME=;
        b=gf8E0pgsBCakh+RaKRNl5kfZ3LadJYShkWMrSvwNKqL9DjvTTKfUAHqf/Scj+ECM6+
         4fDHsNlwDZOzszeFotiMZ7hhGlGNw/n64Rs+Z0ChI9ZlX3OG8+qk3N+kPPb7mRIbqcxo
         48RXRdEfskAy4Q49gbdmzOC9QcPdfUwP7d/RvvPmbFr1UtESCC4to3f30byog+CeuGOp
         1CjbdhHEV0VFhs4ZHVK6kFdm6Ui4ZkX23fCs50hAv55BeOmCKU9okgR2OfQ+1q2heFFe
         Iqz+gZsYOmErZOpCgQCRfVrJ4D6ILJabmo020sr/hI0MdRB7bHmOHnn3wlCZxeXEH7Ma
         ppyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795116726; x=1795721526;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zHELh1wvQ9nrwWZUArifTWwLGXrX5lfqWf4Gv/ulNME=;
        b=hdgXveIKL18Zz9HHFiyu/WiusBpunry1jEGk3FVvNu9G9/EytKdjyvLVRZNTuCdxge
         n76vkldaWvxdriL2Pl12ZwBMa2/VpCqyEk7sfhECqlcZi2WHr3ZgIDc42N/WupHBk0Kj
         4O4vV/fxlMv2GYyvN9Pz5u3ddA5QvzHOlhEvopFYoeB4KGHA/fcEmyR6JWggi8JTK8EW
         sz72FF+frI+TfnwvPchqK84HrreklCVaT53nlOt5DxXQBdb5ask3txBpdUeh71hurNFl
         QZXxbFDDD5crLhq5yxySYP3lGIi2LVuzzlIZ46KuijRQjasul/6T8cLDfnxKY5IlLDDB
         ludw==
X-Forwarded-Encrypted: i=1; AL+hErH4IP9JZd2G3rPV1nR67uhGsftjKUJ005xabrg7NSEC2pjp9y6+OYlLWc36dijMFikpcc2wqIQY2T8JXgM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/erXe2SXxKEgQ3FBn7wZfYGr8WXsQVAQsxJRbbksB/r58C4I1Y
	Xrqy4K3CCe2asAASBb5sLsn5EHtY41abgMvC+ZXj2As9MP//i15X/EymadlMd/XuWF8JF3/Ngdm
	blPyit6LSp2TqMIR2ERviMbr2fR0E6p5DzInviPJtNA==
X-Gm-Gg: AZFdTZc+5EkS9OSGM1Ac1LxRjhnan7cLhPSQmEMUPAxIPU+nPUyVE7Rm1BZX9J9bBAf
	2/O7zJHfr2BS48S1U1nn7Z3lV9uvSBAB7lpQOoVNRFvEgIOk912zIZpN7kvLWDY5tB5AnjVq87T
	tjatnWkp/DPg19Red4yYL22OCOrFdgfVp9G3DS5sb9cUf8+JLO/TOT1iZduZ09UnhdqiSJ8GbYz
	kw0cf+bLfDW/D+5lCCSUUAR2pLXQo0LEKgXpPN9mOEdEFYmNmyTRjphZMaQeDDswyHcwzwN3fAw
	qk2Ggd0RfNJtPB2IDsdFHIXoeVq5pBKU0pX/z1qu/qcXCJTKIKqMhnS5BSvncbcOj1AIvseRXIH
	8pY5PZjOQANWvZ30wyaw7UIBGyQS/AQ1lhA==
X-Received: by 2002:a05:6000:4705:b0:48f:cb37:3ec3 with SMTP id
 ffacd0b85a97d-4abb400c591mr853280f8f.41.1795116726352; Thu, 19 Nov 2026
 11:32:06 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261119-xen-tpmfront-v1-1-bfabbbed462a@gmail.com>
 <av8Tr2jTQaOBOEid@kernel.org> <8c988944-34e3-4fc9-a323-daca101c1bab@suse.com>
 <av8kIqYC04D5QdXf@kernel.org> <3b37565a-4dd7-454d-99b7-108b8e4e7133@suse.com>
In-Reply-To: <3b37565a-4dd7-454d-99b7-108b8e4e7133@suse.com>
From: Wong Steve <shyckless@gmail.com>
Date: Fri, 20 Nov 2026 03:31:53 +0800
X-Gm-Features: Aa3M54rJ-G9ninS-5Hi_IFXsKYFH3S7hyehBNAqEoZNCg_X0cyVis4rAtusXM0A
Message-ID: <CA+X8Sdj4KRfJagaKHkcXrv370Si_WktanBqRN-SrB7qOMH=FAg@mail.gmail.com>
Subject: Re: [PATCH] tpm: xen-tpmfront: fix use-after-free in backend_changed()
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Cc: Jarkko Sakkinen <jarkko@kernel.org>, jgg@ziepe.ca, linux-kernel@vger.kernel.org, 
	sstabellini@kernel.org, linux-integrity@vger.kernel.org, 
	xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Juergen, Jarkko,

Thanks Juergen, that explains why nobody has run into it: with the
stubdom backend the frontend never sees Closing or Closed, so this
path is only reached with a backend that does close. I agree the
normal state machine should stay.

So with today's backend this is latent. Jarkko, if you prefer, I can
send a v2 that says so in the commit message and drops the
Cc: stable.

Thanks,
Suyuan

J=C3=BCrgen Gro=C3=9F <jgross@suse.com> =E4=BA=8E2026=E5=B9=B411=E6=9C=8820=
=E6=97=A5=E5=91=A8=E4=BA=94 00:32=E5=86=99=E9=81=93=EF=BC=9A
>
> On 19.11.26 17:30, Jarkko Sakkinen wrote:
> > On Thu, Nov 19, 2026 at 04:35:02PM +0100, J=C3=BCrgen Gro=C3=9F wrote:
> >> On 19.11.26 16:20, Jarkko Sakkinen wrote:
> >>> On Thu, Nov 19, 2026 at 11:20:33AM +0000, Suyuan Wang via B4 Relay wr=
ote:
> >>>> From: Suyuan Wang <stevewong@hust.edu.cn>
> >>>>
> >>>> When the backend moves to Closing or Closed, backend_changed()
> >>>> unregisters the device and then keeps using it:
> >>>>
> >>>>    device_unregister(&dev->dev);
> >>>>    xenbus_frontend_closed(dev);
> >>>>
> >>>> The xenbus watch callback that calls backend_changed() does not hold=
 a
> >>>> reference to the device. The tpm_chip registered by xen-tpmfront has=
 dev
> >>>> as its parent and holds a reference to it, but tpmfront_remove() dro=
ps
> >>>> that reference when it unregisters the chip. So device_unregister() =
can
> >>>> release the last reference and free the xenbus_device, and
> >>>> xenbus_frontend_closed(dev) then accesses freed memory.
> >>>>
> >>>> Take a temporary reference before unregistering and drop it after
> >>>> xenbus_frontend_closed(). This keeps dev alive for the last access a=
nd
> >>>> keeps the existing order, in which TPM operations are stopped before
> >>>> the frontend is marked Closed.
> >>>>
> >>>> Found with a static analysis tool and checked by hand.
> >>>>
> >>>> Fixes: e2683957fb26 ("drivers/tpm: add xen tpmfront interface")
> >>>> Cc: stable@vger.kernel.org
> >>>> Co-developed-by: Kaixuan Li <kaixuan.li@ntu.edu.sg>
> >>>> Signed-off-by: Kaixuan Li <kaixuan.li@ntu.edu.sg>
> >>>> Signed-off-by: Suyuan Wang <stevewong@hust.edu.cn>
> >>>> ---
> >>>> Compile tested on x86_64 (W=3D1, no new warnings). Not run with a Xe=
n vTPM
> >>>> backend.
> >>>> ---
> >>>>    drivers/char/tpm/xen-tpmfront.c | 3 +++
> >>>>    1 file changed, 3 insertions(+)
> >>>>
> >>>> diff --git a/drivers/char/tpm/xen-tpmfront.c b/drivers/char/tpm/xen-=
tpmfront.c
> >>>> index 3c0cce57c4ae..1be925cca535 100644
> >>>> --- a/drivers/char/tpm/xen-tpmfront.c
> >>>> +++ b/drivers/char/tpm/xen-tpmfront.c
> >>>> @@ -397,8 +397,11 @@ static void backend_changed(struct xenbus_devic=
e *dev,
> >>>>            case XenbusStateClosing:
> >>>>            case XenbusStateClosed:
> >>>> +          /* device_unregister() can drop the last reference to dev=
 */
> >>>> +          get_device(&dev->dev);
> >>>>                    device_unregister(&dev->dev);
> >>>>                    xenbus_frontend_closed(dev);
> >>>> +          put_device(&dev->dev);
> >>>
> >>> Not a NAK but makes me wonder why this has not hit the wall ever.
> >>>
> >>> I.e. "feeling confused".
> >> Is there any vtpm backend other than the stubdom based one?
> >>
> >> If not, then it is quite easy: this backend never switches state to
> >> XenbusStateClosing or XenbusStateClosed.
> >>
> >>
> >> Juergen
> >
> > Should it be removed use the default-fallback?
> I don't think so.
>
> There might be other backends in future, so following the normal Xen PV-d=
evice
> state machine should be kept.
>
>
> Juergen
