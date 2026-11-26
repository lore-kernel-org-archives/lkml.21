Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795730016;
	b=Wj8f1NtcgSLfi8A3m08phKTbBIGGFvNKgpttRPY8DnBhtObriRxDi98oFoxKSWpvUU9U
	 4lYC1imaXh4btuC+50a4OiH7agidfQUAIQDPb4LYHZcQSrxytOv2wcxce2PuP3q1OGYG8
	 jJypBXvn50dsgUBMH9jTyg+vtVuVa3PlFEx+BE7CKKYT0sDMdOWVIcpw5lt20HwkmsMuy
	 fyYLZZvFs6yshudptSa0CLova7d3ezZhZ1BmyC3x2szA8HV/vPo0eoyzUwPG26gtU8Gvk
	 22DpWSbi+XuPh69luuQCZjS7dbuzV6zK+H0+V3aR08o4969d4qSp+W06WKLpP58/LAg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795730016;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:Autocrypt:
	 Content-Type:User-Agent:MIME-Version;
	bh=env9OD6WJ5uGqN3vphpmLPvAyZWACc9jYsEiViZZwfI=;
	b=uZ2xawL8vmKf9101urhph7LYCVZ/tzDxBAqu3KHTAL6rbUrN/FWr9HGzl/gjDL5BlndA
	 60s5dBSG6SBltyUhLSMQuniTQF4j1BlddWymEJhQr4PvlTp/z1bvgY6Okvs8QsR588jdX
	 OmfQFIg9WmWFcalzXGO5ijAhWiHI1VVsU3QAdJSEeN2SHLMVCPqCmbh620Sg6vwIOGTrF
	 IYJvy3U3aOvZbhvMfsv05WEcEsfkvLuKVSgL25cytV4ZWEg8uqW1boesRqXq8PdLnvZXW
	 EtjiS/UZiGEjph7MgXr0EVE2evvho/carnLA3DLpHWQgHY7hBYCpqLwKxgfHpyf9n6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ndufresne.ca;
	spf=pass smtp.mailfrom=ndufresne.ca;
	dkim=pass header.d=ndufresne-ca.20260707.gappssmtp.com header.i=@ndufresne-ca.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b="HuAe/wTW";
	arc=none smtp.remote-ip=209.85.222.181
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8668F606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 21:53:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8668F606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20260707.gappssmtp.com header.i=@ndufresne-ca.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=HuAe/wTW
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-94999a08973so683363385a.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 13:53:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20260707.gappssmtp.com; s=20260707; t=1795730014; x=1796334814; darn=vger.kernel.org;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=env9OD6WJ5uGqN3vphpmLPvAyZWACc9jYsEiViZZwfI=;
        b=HuAe/wTWSVBcTgkxqCs3FJVZTgk/EcI6TOIk/kQi88nOHPAz0IshwbNbEr9Us7ruS9
         oUhp8H+XFRHy66KiBCKv5x7c1t25JuGVrf/6gTpXoX/Q4yi8td24zb+qNt4vl+x8JF9j
         3TePrqRHUwd96jczTkAsWm2Sc2zluXhSr7i95q5wn4+m6CJ1OaMe3tfBOPWVU/GMp1/f
         yaqEplLMmytsHbZf9bChl1Te1JVAbwU1f6gs44bw89kfVDemUCWTSnBRBWgBxq4Dh9Vl
         vvCtLyecMfxLcxBGfFCNqqVrcDk7aLV2HDYFOUllwxc2aWPqsfEgKcRyr2ZFRNHT5WmC
         I5WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795730014; x=1796334814;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=env9OD6WJ5uGqN3vphpmLPvAyZWACc9jYsEiViZZwfI=;
        b=ZQeO7IjHfcNrvyOF5DhOtrk1zWE/91AoB3ly+rqbQ48GyKLM17TfcglKJUlBziF95d
         Hq1VtVfN/x0u4eKL/Vft5QlZx9WCLtqwyPJpDD7MTJDAuM8Re8na+kt1KPnemuChN7E6
         RJlGs7yNTkyv7H1W04G1PJZYo+kHlZFiSnI4lERJTFQ2PnXCJqG8TLlpAqXSHdmwgA3+
         xPZe4AXO7s7AWN97W/t0Le/xsd6htYQI4YiUWzvyPHm4xpY1hFrrifF84UETe6RHW0tq
         2KNowSApAW0AVLv1buHkhAYGgK4bSuyiWoRDCoco3ioVQDFwhBR/CC2IL2K7Mppa6NYZ
         eB2A==
X-Forwarded-Encrypted: i=1; AL+hErFOMDGEhpz2Q/sCF5jKlbraKV8uFq7w0TsgAaviJro9kbV/w7OXinRuZtKV2vZw+ECkIxQcUV+7iGZqCpc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+irbzt/dMIg2lXAhxFp6C8vIghnivuGovg4gylX4LEuuZY+jjG
	utP94dnGikQVBYtBxRdr8ZEdDLHLEF57ApqEzM7M47jKU7TLFwPfEv27kcnzdWm0Us0=
X-Gm-Gg: AZFdTZcc394PP3wJR63XbMuqnHGeRxBevIqvFYPE3fx81mPXvxRA0FXtvPW4HTzT9a8
	386RgHLeT/c1d0SULgKQjoD5yMPs7+FTFT5nxl/lHX1J+Sb4VcdmgH7wdfaoqS7bzqsGb4YY8kJ
	9oQBCIxaGeZoG8W0FO3A1tgXVUBSjNgChfzHi28QR7scih5UWJM1DFuy98tuUkbTCCJt9blrxaV
	p5/BEPnWODV+xxG22Ofou16maZG9rhytYHMEAaSAy0x6Z2Gfv7onYKK1E5uEw7XVPhmesxLbhe3
	1HIruHmr+sV5fLwkzH721yr3ExaDDuE4CQxIZIjmmSJP572ZSyYCpb2qKl24FfkJ0+aSpYIc4WQ
	xSNNgWSD6TxmYK9BOgM9sXh3dBkiCj0nj73lvMEqJKGN1TMJqB0p9t7LS7cb1whutoUIJY40Nn9
	rdiKR7o6xEstS77121n7rJxesT0RYCxBAIiN/0X0mh861vjqzMrKqZxfJptswotDmtNLNtTkx9+
	X/sxNOl3T9ZwgGOKwpbDW95BDx25TsLJSzJnbB436YKmieXzU0Zr6/bXVU8HTwnDsoHY4m9zS/J
	SxrADaOVWfTvRoVp1rHzu20nYmUsFtVMyp6JS56if/uatD0+1omN7UU=
X-Received: by 2002:a05:620a:6011:b0:93c:c1e8:6504 with SMTP id af79cd13be357-949ba9555e2mr3721601785a.23.1795730014488;
        Thu, 26 Nov 2026 13:53:34 -0800 (PST)
Received: from ?IPv6:2606:6d00:11:8ec9::c41? ([2606:6d00:11:8ec9::c41])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949bb349db3sm1654907285a.7.2026.11.26.13.53.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 13:53:33 -0800 (PST)
Message-ID: <a7e72cdb67e7ab8578b9ce44a4817ba35d1f822b.camel@ndufresne.ca>
Subject: Re: [PATCH] media: mediatek: vcodec: NUL-terminate debugfs input
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Jiale Yao <yaojiale02@163.com>, Tiffany Lin <tiffany.lin@mediatek.com>, 
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Yunfei Dong
 <yunfei.dong@mediatek.com>, Mauro Carvalho Chehab	 <mchehab@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,  AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Hans Verkuil
 <hverkuil@kernel.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Cc: stable@vger.kernel.org
Date: Thu, 26 Nov 2026 16:53:32 -0500
In-Reply-To: <20261029053024.2526059-1-yaojiale02@163.com>
References: <20261029053024.2526059-1-yaojiale02@163.com>
Autocrypt: addr=nicolas@ndufresne.ca; prefer-encrypt=mutual;
 keydata=mDMEaCN2ixYJKwYBBAHaRw8BAQdAM0EHepTful3JOIzcPv6ekHOenE1u0vDG1gdHFrChD
 /e0J05pY29sYXMgRHVmcmVzbmUgPG5pY29sYXNAbmR1ZnJlc25lLmNhPoicBBMWCgBEAhsDBQsJCA
 cCAiICBhUKCQgLAgQWAgMBAh4HAheABQkJZfd1FiEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrjo
 CGQEACgkQ2UGUUSlgcvQlQwD/RjpU1SZYcKG6pnfnQ8ivgtTkGDRUJ8gP3fK7+XUjRNIA/iXfhXMN
 abIWxO2oCXKf3TdD7aQ4070KO6zSxIcxgNQFtDFOaWNvbGFzIER1ZnJlc25lIDxuaWNvbGFzLmR1Z
 nJlc25lQGNvbGxhYm9yYS5jb20+iJkEExYKAEECGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4
 AWIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaCyyxgUJCWX3dQAKCRDZQZRRKWBy9ARJAP96pFmLffZ
 smBUpkyVBfFAf+zq6BJt769R0al3kHvUKdgD9G7KAHuioxD2v6SX7idpIazjzx8b8rfzwTWyOQWHC
 AAS0LU5pY29sYXMgRHVmcmVzbmUgPG5pY29sYXMuZHVmcmVzbmVAZ21haWwuY29tPoiZBBMWCgBBF
 iEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrGYCGwMFCQll93UFCwkIBwICIgIGFQoJCAsCBBYCAw
 ECHgcCF4AACgkQ2UGUUSlgcvRObgD/YnQjfi4+L8f4fI7p1pPMTwRTcaRdy6aqkKEmKsCArzQBAK8
 bRLv9QjuqsE6oQZra/RB4widZPvphs78H0P6NmpIJ
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-DlJB1J9haeeqeVzf+bdm"
User-Agent: Evolution 3.62.1 (3.62.1-1.fc45) 
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

--=-DlJB1J9haeeqeVzf+bdm
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le jeudi 29 octobre 2026 =C3=A0 13:30 +0800, Jiale Yao a =C3=A9crit=C2=A0:
> mtk_vdec_dbgfs_write() allows userspace to overwrite every byte in the
> persistent debugfs buffer. The read handler later searches that buffer wi=
th
> strstr(), which can read past its end when no NUL remains.
>=20
> Reserve one byte and terminate the copied input at the updated file
> position before releasing the debugfs lock.
>=20
> Fixes: 5e488a4fd859 ("media: mediatek: vcodec: Add a debugfs file to get =
different useful information")
> Cc: stable@vger.kernel.org
> Signed-off-by: Jiale Yao <yaojiale02@163.com>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
>  .../media/platform/mediatek/vcodec/common/mtk_vcodec_dbgfs.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_dbg=
fs.c b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_dbgfs.c
> index 2da11521fc7b..8528534e41ef 100644
> --- a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_dbgfs.c
> +++ b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_dbgfs.c
> @@ -77,8 +77,11 @@ static ssize_t mtk_vdec_dbgfs_write(struct file *filp,=
 const char __user *ubuf,
>  =09struct mtk_vcodec_dbgfs *dbgfs =3D &vcodec_dev->dbgfs;
> =20
>  =09mutex_lock(&dbgfs->dbgfs_lock);
> -=09dbgfs->buf_size =3D simple_write_to_buffer(dbgfs->dbgfs_buf, sizeof(d=
bgfs->dbgfs_buf),
> +=09dbgfs->buf_size =3D simple_write_to_buffer(dbgfs->dbgfs_buf,
> +=09=09=09=09=09=09 sizeof(dbgfs->dbgfs_buf) - 1,
>  =09=09=09=09=09=09 ppos, ubuf, count);
> +=09if (dbgfs->buf_size > 0)
> +=09=09dbgfs->dbgfs_buf[*ppos] =3D '\0';
>  =09mutex_unlock(&dbgfs->dbgfs_lock);
>  =09if (dbgfs->buf_size > 0)
>  =09=09return count;

--=-DlJB1J9haeeqeVzf+bdm
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCawiqXAAKCRDZQZRRKWBy
9HvlAQC+KcPKwSaD7Ix8GCPtMRz0njYszGlIhj94VYNm0BjnnQEA8O7IpD79HTUk
JcUCeKPKDEyp+qT34NJFPS+wfxGcZwY=
=kTt2
-----END PGP SIGNATURE-----

--=-DlJB1J9haeeqeVzf+bdm--
