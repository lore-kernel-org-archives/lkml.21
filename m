Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795299323;
	b=yKZ9fxIthZxzTMeYIMbtda2PLTeuJ5Qn3tTy3mDQWdnDn1mh1AzckZSSEeqRTPjEoVxq
	 lVvuGWhn3JDhs/2RdHBW48is37BFdNJSj/OIXe/f9rK6oj9sXY9QkMRvFMr+oFrzwydC6
	 SHw7GVLiFZai0CDy7/wDUjpmc2k2wUHa4XNOpLDAC2+F7s6dZ3wRBnpUb+xiiRmj7dCcn
	 NddVvGkAA8Cqt1Hw/rokfe4fnwsRrNKSkbp3ysy+0Nho+yNmrGiyq45rRWenmTp6beUcq
	 3WCJWFQmXYk8aktNWObfiveoB1Lc34mV6z+FIxBt4AWBLHdJowLZTnUJY98KHfk4L5Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795299323;
	h=DMARC-Filter:Received:DKIM-Signature:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=mH/+HF1RnSn0VdGqHofmX+T5xI44EP7QYLL7JgyUiqc=;
	b=XMvm5BINOsLZPpQwg/BceOqKzC0/TrGREDuFa/Q1YyCIOFHipckrBBJMiWGW9HHIRdnR
	 4O2ExFEelnIg28EwgdGXudIRk93OiiSo8srSXb1DN9HLbHlXQzdWpE2a9FrL/aetL5XTn
	 CBC0efRbqeJOGNpkDnjqs9CMv7JL6YYWCon0qRGDAEV5QBuRHG8rZB6Kd/mhv45so89jg
	 3XGMr8TGsOmAvrgFJ2OZE+lDiTZ+BnLcFD+EB7YHzBaUFu5oon61kzCuT7Grm+nW8SGFA
	 RLMAMnYLZxxQz2x2pjelpIlJ8PojWpPLcXjWqcoG8n2BNCXOH2rP7tHG/Wsq7MgjkTA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=pengutronix.de;
	spf=pass smtp.mailfrom=pengutronix.de;
	dkim=pass header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=UfacSTJL;
	arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 438C7606A320
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 22:15:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 438C7606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=UfacSTJL
Received: from pengutronix.de (ptz.office.stw.pengutronix.de [IPv6:2a0a:edc0:0:900:1d::77])
	(Authenticated sender: mkl@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 2DB1F201862;
	Sat, 21 Nov 2026 23:15:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1795299320;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mH/+HF1RnSn0VdGqHofmX+T5xI44EP7QYLL7JgyUiqc=;
	b=UfacSTJLOLKPGJZsp4Z678h3+PrCxbw+k6QSz7tWQgdZb3vHtoHcF6IC/K8LTQa/bfqUFb
	HrbDa6VRfNDn+OBcVp2k5jZO/1A6HJEVfQtOVy1pIUA9RK52EcEovj8R2CdXP8tT5i5Vm/
	V19E47gsDLiFlmJo/YHmLYHKVy4wLllAC7uvq2GrKINhTD3ICOPBUOBmMk7QMXldlf6+PY
	tYdtn6J3nr2k4DuHhQzpioC1ek9xXZjm0j06fneG7bEDnMD+Idi8VS7xK+1d+mjNVszIKf
	mdtNzqcE0J/oIva2NWhLVI5zpjI0ULMup+06ZdD/T6WFHs8lP1tCZjp7rFvK7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1795299320;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mH/+HF1RnSn0VdGqHofmX+T5xI44EP7QYLL7JgyUiqc=;
	b=ODppdvHqnU7ya/fqL+B/aE/OnYve2EAVmGEKdoJiLqRvHsuyIii8GP+diwSI5HRGn+DNUg
	daoyrV5SOLOxYQMNJGBH+Gp4OshCw2QGGcvepydmOe101KSQ1SfWhzx2k4uwMG9MOvOvos
	yL+ehG0IkPbBoNj+TpsQYF7sJ9CCIv8G+PYAJNjS8TvXIL0N+sMbNUf6ySI/lAifCA7jYI
	beT/wJobZwBusp4wytcsOmO3IPcyGJCWo5G3+ZNjldNXbqGxEb4b+mVlWUo3YY0yJ5JGCv
	iy0HJ58RZ6Hph66Ru+yMFElncgfuXkInrvCYFQW2i1tD8pf3UH5d7wP4S3eHYg==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1795299320; a=rsa-sha256;
	cv=none;
	b=VeSSIUqxwp3HSpl6U5+jtaoCEm9KCLe8cyRmVVfttZkp5QweFZdyemO0L5ZL8QPNuRA/PF
	Pn+Hszo7AMjizq6YIFZrlkNVXvYFSw5FzbexSQsNOvojqAOC5uX9kFq8PHQ1PO0z7LnKMT
	TazUloed/FL2t0fmMKP/YGW+JMC0J3Nx+zcw4q5xrODbSkITKhgq8lcGVJwjOsEXnVMvef
	xhxvMT2To6EEFAjLPiH+63W1MoHmmyHKfVi9ItnBaVY+sxci8WAE5osgxkl7B1Q8n5sAVA
	yA3fAt0rZK6qoWFEd0HYLXj9wPwT9r1Wb/MAwa+oO2TCNsYN/O/NfIvB1z5QXw==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=mkl@pengutronix.de smtp.mailfrom=mkl@pengutronix.de
Date: Sat, 21 Nov 2026 23:15:19 +0100
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: Joe Perches <joe@perches.com>
Cc: Andy Whitcroft <apw@canonical.com>, linux-kernel@vger.kernel.org, 
	kernel@pengutronix.de
Subject: Re: checkpatch: false positive "Alignment should match open
 parenthesis" with struct_group_tagged()
Message-ID: <20261121-funky-calm-mouflon-52a711-mkl@pengutronix.de>
References: <20261121-gifted-cryptic-mouse-9362cf-mkl@pengutronix.de>
 <834075e9deed32d899fd2be851620ece2c906404.camel@perches.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3zovrofmj66wzhhk"
Content-Disposition: inline
In-Reply-To: <834075e9deed32d899fd2be851620ece2c906404.camel@perches.com>


--3zovrofmj66wzhhk
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: checkpatch: false positive "Alignment should match open
 parenthesis" with struct_group_tagged()
MIME-Version: 1.0

On 21.11.2026 13:51:05, Joe Perches wrote:
> > it seems that all users of struct_group_tagged() in the kernel indent
> > with 1 tab, like this:
> >
> > > struct gs_host_frame {
> > > 	struct_group_tagged(gs_host_frame_header, header,
> > > 		u32 echo_id;
> > > 		__le32 can_id;
> > >
> > > 		u8 can_dlc;
> > > 		u8 channel;
> > > 		u8 flags;
> > > 		u8 reserved;
> > > 	);
>
> Thanks for the report, but I don't care.
> It's just an unusual macro mechanism.
>
> include/linux/stddef.h:#define struct_group_tagged(TAG, NAME, MEMBERS...)=
 \

=2E..it isn't used that often anyway :) and it's only on the "CHECK" level.

regards,
Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde          |
Embedded Linux                   | https://www.pengutronix.de |
Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

--3zovrofmj66wzhhk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSl+MghEFFAdY3pYJLMOmT6rpmt0gUCawIX9QAKCRDMOmT6rpmt
0g4JAQCM9Vn9c/iBGEP+oHlJr1eUjJvTC0sHz/ncrnD5DsfzbAD/RC5jED5k7K+d
wnCU4RzIcWNzLckB2MinNp9rtwVSxQo=
=rJHM
-----END PGP SIGNATURE-----

--3zovrofmj66wzhhk--
