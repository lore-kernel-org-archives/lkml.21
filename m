Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795183842;
	b=X0u3YngqZo4Wo/OxoldedyvVovxYmClwoRL/7H5WwtOgSOiDrDWYK8c2dB1v/jN0kobQ
	 /sQ9v8/APkcKDs9bk85GLDkRBmdeYcEKf+aeoX8GkcBqI+YcY4b60YGvbAcsK2kmXOpPU
	 8ZIU9dGpcdqYDxFaEDTjl0tRFuJBtP65IAxcgRbWF19FhkhNq8rsGVvy303efanYIuhnd
	 lK0JVV3mQgfFtOwraxCxoe3tNfeOM6dreEl4CIRm4HcPHZrposIb4n/RMivdaS70YiEwf
	 ykZ3XM8OVmaaDbUQFZ3Zw/cqSaDc9XcXSmAMIAY7PvyuNCttla0sCcKupe9wXKuCtgw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795183842;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=5S4P9EVhrzfLBPEUlAs5RhZwbxTfoymelcBjiUJ2aGo=;
	b=O1o3ewekMBI4qhizZOWY1L7CmSPVWcuQrFHxLlyX3pyolX+DbwG97AEOInWrzBklva5d
	 IUI5H7aKMf6TF/O5pKG4L3SUaDnqVaGm3/XEcnJzj3vVLwhwjEzDAf69TFgBVzxWRK9nk
	 c6dsiI5nMmVcVdAfDs5aBJ0bZDvbhbCxLs1L+QPD+AN/NhSBF6MTxXktgIqqa5Yj5q5c3
	 2pSXAcfEtTp3yBik50CxVw9dWTcmk0XQPD8hCv2rRS2GHS9SNkuDvSFE5upmXEdyH/8nt
	 GG+bLa5ozYSvVcDhbT5foKCv1zbk68dPCPJQ/ZYSKY5EU1Ax93w1HT3PSWDruj1wfhA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=GtG1iaQR;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E123D606A331
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 14:10:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E123D606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=GtG1iaQR
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4bb5b8ef642so8219575e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 06:10:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795183840; x=1795788640; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5S4P9EVhrzfLBPEUlAs5RhZwbxTfoymelcBjiUJ2aGo=;
        b=GtG1iaQRI9u9ARXabDEe2D8SnnTyfL+8UjK/8tqYjNwSU2a9LuKhrlTU/lolo1fBCy
         RDXey437ySP9hiMo5QnJD6PtHaw+F6Wm4BqNZ5ctCKbAFymc2+vqkB6N6NXnQATAuFRD
         yJb5e8zbLw74CQfoie3zzYHaCY6EU9YGVeRppeU8xhgcUI60o0ILXKInDYZh1OPny0rP
         euD7j7EKrlNYddojjjsLrgMjEaCgk74eQrjoFa8jw3DzuIq57Zg2AbYdM1+ZRrk9PgFs
         cU2/mDTVEffUIcg1EQR80oRe7thSm0zVOcNSnsDNUgyUVQfMBfSB01AnLEf87AeP79MZ
         VJDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795183840; x=1795788640;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5S4P9EVhrzfLBPEUlAs5RhZwbxTfoymelcBjiUJ2aGo=;
        b=ScjdKn2YMZdiMQfmQ/QKiZ3x+UXv5660dq8ckPE4VdjHK6jj0Bjd2D+FWyNs5nsMiT
         Sgpq237zg05wYaOvvieViueOr7yaZY0jEH1N5Mc/rHZrCOQINqh1NksDTvqeoqgFbWe2
         cb5PTd6wbrXmNXxKa6NfA0K4hS7lJRiQHa49icvswXUZmIMhk2//IwV+83Ns1u1KbxTZ
         lfOoXUmpF6QfVT9y1jEJDRvtNQuJfeLClZZ05rMNuL5rdSfM0t7p8XWipMeTlGWedhqi
         5NDOSz6/ZkXB0aoekHnZjz+8qbNGAzAYjkbfYvuXIqB291IfJCqKbfkI6BXxDhZSRrpX
         nC0Q==
X-Forwarded-Encrypted: i=1; AL+hErFZK4SAknH14BpEwLBRHKVg011iGJ0xSSHpyP2n51a5wz6xp5VlWmOtl1CgIfcjd07XzrPMlvk+k0B4/M4=@vger.kernel.org
X-Gm-Message-State: APuU4Z9ymE5CpgmKiusqk31Q13yFwZodvUZkG/CV1kkqyLEtaV11AGeL
	MI6BB6kB8iP13N6pzGz7ucs9wL5lW7jB97L4ztC/FtBWoMeQ3ElUFrwh5HylrUQ5KBY=
X-Gm-Gg: AYBFou320LOdPglztY9qRydubk7ULj+RkEc0M5bBoGv2O7oU0d6Piyam+li5yyx1Vb5
	dZgkzMsy9Wdo82EO0K04ilDKLpAJ16PmxImseMM+zjdBC6Mot98I5vcjlVHIhMJ+pFlPnSW6VUy
	mw/u7/d/ib67DSRjWlkzYWH78hvql6vVwmYzT0Z871XUK8uMgrUUN2hVpCREGJ4VVevONcksvef
	lLitbiPwecLy+9yC+QVWYH0t24UvnLUh9+oZxuNeA8THKwBqAdfPZL6A6I4L0oObcR8F4lj8bvR
	5FIEwQs7soIGWIXe1ZN3KEIki9OjRpDojTGS55Ow0Kp9g+rR7khhhMLVZwaONUnxVErsbBoKJLM
	So9JcrTbUOjQSxEZg3pssyKDnEfoQeB0yvVjdZ7+1IbJPQbUGzUMvc6MvuGWyfmVjtJqQRRh/o8
	EL7IOYDtF3SO14qg/DzJrgE+AV0T272XN5PhduwJsHQTg1wypPt/TGBc3U8IPaot9UNNtx6GtkJ
	aQp7t+zjSSF7/wvP4Dxba+oImeFUoF/mbQlOa+K6vVuCTfxvnHwaQFUZdp3raUXpdbuUXxGcTNi
	0IwH+zkoWoe41IEL85aS9Hcpu5KzAM+98oZlgGInKkwUeLJymRA1HdiXuck3Lj1bCKY5GjWZD10
	mfgwRC+ereWajuhRJ
X-Received: by 2002:a05:600c:3b1a:b0:4a7:8fe8:130c with SMTP id 5b1f17b1804b1-4bb8881d4damr71087005e9.28.1795183840190;
        Fri, 20 Nov 2026 06:10:40 -0800 (PST)
Received: from localhost (p200300f65f19a9041d3eb07d772156f3.dip0.t-ipconnect.de. [2003:f6:5f19:a904:1d3e:b07d:7721:56f3])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4bb895f66e1sm37012445e9.0.2026.11.20.06.10.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 06:10:39 -0800 (PST)
Date: Fri, 20 Nov 2026 15:10:38 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Yao Yuan <yaoyuan@linux.alibaba.com>
Cc: Alex Williamson <alex@shazbot.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
	Johan Hovold <johan@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	David Lechner <dlechner@baylibre.com>, Armin Wolf <W_Armin@gmx.de>, 
	Thierry Reding <thierry.reding@kernel.org>, Mike Rapoport <rppt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Karl Mehltretter <kmehltretter@gmail.com>, "Paul E . McKenney" <paulmck@kernel.org>, 
	Borislav Petkov <bp@alien8.de>, Dapeng Mi <dapeng1.mi@linux.intel.com>, 
	Marco Elver <elver@google.com>, Ethan Nelson-Moore <enelsonmoore@gmail.com>, 
	Jeff Layton <jlayton@kernel.org>, Bradley Morgan <brads@mainlining.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Petr Mladek <pmladek@suse.com>, 
	Pnina Feder <pnina.feder@mobileye.com>, Mete Durlu <meted@linux.ibm.com>, 
	Aaron Tomlin <atomlin@atomlin.com>, Rio <rioo.tsukatsukii@gmail.com>, 
	Feng Tang <feng.tang@linux.alibaba.com>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	driver-core@lists.linux.dev, linux-trace-kernel@vger.kernel.org, 
	Mark Brown <broonie@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Yishai Hadas <yishaih@nvidia.com>, Longfang Liu <liulongfang@huawei.com>, 
	Ankit Agrawal <ankita@nvidia.com>, Brett Creeley <brett.creeley@amd.com>, 
	Giovanni Cabiddu <giovanni.cabiddu@intel.com>, =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>, 
	Julian Ruess <julianr@linux.ibm.com>, Nipun Gupta <nipun.gupta@amd.com>, 
	Nikhil Agarwal <nikhil.agarwal@amd.com>, Eric Auger <eric.auger@redhat.com>, 
	Mostafa Saleh <smostafa@google.com>, Pranjal Shrivastava <praan@google.com>, 
	Ioana Ciornei <ioana.ciornei@nxp.com>, qat-linux@intel.com, virtualization@lists.linux.dev, 
	intel-xe@lists.freedesktop.org, kvm@vger.kernel.org
Subject: Re: [PATCH] vfio: Allow untainted use of driver_override
Message-ID: <awBUG7-QzXplEiUT@monoceros>
References: <DMYH4ED3GWDO.29DGXPK4M82VR@kernel.org>
 <20261118235645.2907908-2-alex@shazbot.org>
 <xzp5gljhburzbpol5bgnyyzwdrgpw3fj6ff3j23ein27raiidw@kti7moeuwvb5>
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
	protocol="application/pgp-signature"; boundary="76ybofus6n5n73yb"
Content-Disposition: inline
In-Reply-To: <xzp5gljhburzbpol5bgnyyzwdrgpw3fj6ff3j23ein27raiidw@kti7moeuwvb5>


--76ybofus6n5n73yb
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] vfio: Allow untainted use of driver_override
MIME-Version: 1.0

On Fri, Nov 20, 2026 at 10:17:46AM +0800, Yao Yuan wrote:
> On Wed, Nov 18, 2026 at 04:56:44PM +0800, Alex Williamson wrote:
> > Driver overrides are the standard mechanism for binding vfio drivers
> > to devices.  With the introduction of the support_driver_override flag
> > in the core driver struct, it's now required for drivers to declare
> > themselves as driver_override compatible, otherwise driver_override
> > bindings will be denied or generate a kernel taint.
> >
>=20
> Hi Alex,
>=20
> > Set the support_driver_override flag on the driver struct across all
> > vfio drivers.
>=20
> LGTM.
>=20
> Reviewed-by: Yuan Yao <yaoyuan@linux.alibaba.com>

I missed your reply when I sent the next revision of this patch. I had
to trim the recipients of the v2 because gmail refused to send it with
everyone on Cc: who was emitted by get_maintainer.pl. So please see
https://lore.kernel.org/kvm/fb0df5c89336b77a373ae0f890f63427e4adbb28.179517=
1088.git.u.kleine-koenig@baylibre.com

But also note, that if v2 is picked up using `b4 am`, your Reviewed-by:
is considered as the patch didn't change.

Best regards
Uwe

--76ybofus6n5n73yb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmsAVNwACgkQj4D7WH0S
/k5TyQf/eHBkTiGwub1DLzfSI9Ji/DkzXua0OriEhTmok4cd+2dbl8OfLn0CXg3e
B7W5T3PuQPmIapUivPRGpIJ31hN6+UScHDdfNvj1Xbret/ZoqA+0l48dqU/ikpgB
X4WK2ENvhE+glZpB32rPkpeMadqauuBUmh1TjWnpLKn4QmgLyf+pHIJSnUmH7XkQ
BV2i7AIctyUc2PP/Y+URhj62+6B5pxn3+5BlligAvpjkpg98TxVTctcCEgP4apyk
TI6uZtnd9maFMXHbUJHEArWhVKI8FLAzZySY9/E7u4+tsY0gz/JMib7RngFR2IY4
MPZB/liFV473f+eDblZh9CKsu8DAJA==
=wiOu
-----END PGP SIGNATURE-----

--76ybofus6n5n73yb--
