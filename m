Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795078394;
	b=Mz6qTE8I+gaFv1bb+icSKur7HLqXo+k6qqXCeUz5aYzjpHidxwvFPklEtNn19/9d0Pew
	 NxEHkqhlnDKThXQHoFqSCS+vYvl0uCowxsi2wbEE0A7yUb4Dqb8VCE209EFEX724GljRk
	 fDQCyKaEzJix1ZpTElMi6MSJyiozLu27TMpS6HqhkUyVTd4wDEOWfzRZ/A+HZZ3utMb7L
	 dXlr2CJiYWQcChqylg2QlfbvRt5H/84+XheiIBM7y9e4NP0GYS2HfydfNnw2dNalVLc7t
	 fBM/AJsFo+wxKDVdc8h9Y3IWs6DgqHs3HNHG00FKEqcU1vTumFctCB++PO22Gks/BxA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795078394;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=wfP9MO2UqFb8Vm4Vt7CpNERZfJaN3jidxxklx2/WXmo=;
	b=EIiKYNKswZbwgtLwAltviMwFY1qAKAbCCFjVD3npFvrRyeDnoQZWFR7EXv/bSrmfNln3
	 QCcmkyYvR+19GmWcXd8ixFt3MmHfY2+x9WSDLrO7ta5pvis5syU1ZJFnkhqNiOR/a1WkD
	 ohANYOGyR9PN/9j9eeNl9W4yddULDnexPDXNQ/Gqf+j8CysiJJ/KSHR7x57JnB42Mmvac
	 ln5SFKTWbweQq2ei3lMR6uZtbqOO8xvETnYEiMRy6AklZU5GhPmmm3ILKzE/SpQKYDWTF
	 +ciKkCZjfWQo0KfG4RJ1bfHsYS2wBUeGid3bdaAuW2Alpn5m6p9ZefptpKVXZHitrqQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Hvk12pVa;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B646606A324
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 08:53:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7B646606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Hvk12pVa
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-4a3e706b5dfso1233279f8f.2
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 00:53:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795078393; cv=none;
        d=google.com; s=arc-20260327;
        b=cYb4VRnU85OnKat1AyRJ0fvR8uSwl9NiTV4MhFwGd9BMgvENCHG7IJDNutjSNnDKqw
         DcT2CTHKWFfjSy2uDQl+gFQtuED9U2i4+96PcfXoBOd4cx3G2wE4ANbyHAR/BfXyQVfM
         OukV2pvHY251Utq6Td1mT4sy+TRhNBg3TRiaEcr58LhV89Gdoq776vZOnScuasJkBk69
         RkPqRJlyqn2T+Nm8eoLx11OyEqV8kuPD3c03Ih9C4OETP7oyMF2mWp//jXrrzC45KXHN
         AJ/wDvZ1cURHAshs9gbJjLjKhbGGS3xd01nrL7bj6NXDXn1130BO6/TaqZ4zWORo1+YO
         OF0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wfP9MO2UqFb8Vm4Vt7CpNERZfJaN3jidxxklx2/WXmo=;
        fh=6NwykXDaIUKhSCAx/8sAvjfQ0+lUCjFvnsYQpX8p7mQ=;
        b=eoAY80ZZ9MIF8U19Trj6uzAZ6/QRBDe+7eaf5wK/cwyTjKmpv58AkpXtuqpkYwcvzr
         p6epekLaeh5MLQuugMunaNQUyhiW3KaBb1J1kN9MZreAF/HxiuDQFd+3yAWiUA8chd9A
         IG6Wqqeyt9Lo1HfpxOXxI24HZqSnNzNwXx8w3BtfQkUgL80uj0xMGALx9vNEOPt8LfnA
         X7H73ubLWanx+r6CGww18Zj4JN/6ASE4+PF585bquTlxcEosQJ4eikGLoT9vMAvU+RfZ
         SB4R47PO6M5y3EjBKhyA+WfjXYeqnPekRNa7QceHsNu3NvGRjDK/JR7fafdNgHP2Kpbl
         unOQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795078393; x=1795683193; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wfP9MO2UqFb8Vm4Vt7CpNERZfJaN3jidxxklx2/WXmo=;
        b=Hvk12pVaWSUpS5IGqzjYVweLfTNcFXLn2RSK5tV0Kg+Zi76R2QEvyA9d80HY5lz2Il
         o6C/CKbFqMUTpB9PNHQ7cp1scGSOLK8+z73Ratq+lymmh0+qc6ZPiEegSNCUBgcT+m4e
         ICR/C2gLaW5OrbH0CAXYZ3IA/E8j6mUgHmOHRnw4axF1fd5G0ILfJAybiza1CGntuiCu
         cOljNS+Do5KGJtl+KKtTRDSnDguA0+ekZ0/B3DhXSkn+J+GpUxsAN2B7ZoVcaxaLc25X
         Z3UdyPBNrDKGHGEmFBZ8bB8Q70O4zgZZkhiBDA0r/dtHLyNVMUNRpH08KSG2NikS2333
         qdQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795078393; x=1795683193;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wfP9MO2UqFb8Vm4Vt7CpNERZfJaN3jidxxklx2/WXmo=;
        b=nCN2YC1NBH3fV89nfGpUG7g/Cm4zAfd1bvX/cZ5xFMSzDsYuQtO2sJouQhZkH7tVM6
         NIaINJn6WCdqCgmFm5cfYzcyo8K2bu/jGXUdxSPpgYsRYusO47svUJducRE1HhSDOUCG
         TPf7Qlnz7y8sevyBKaYEFBsb8jOZpjrmU2wBmNmThzwKvSHojZi+budnDOf26NYO9KWr
         wcz/jzFEJ6F26YHl8+lINPKdNKNFOJhKOcCNnzqKagsaMTOWR9CYoo44fOjw5YlEHQlV
         YkKAEq0hl2ETPge/QRwtG78K4Hwg0vXNKAOvsnMszZb+TC9Aai0Yw+LOl67ScoOitTJ5
         tSOw==
X-Forwarded-Encrypted: i=1; AL+hErEO06SbT0jJKCJOZYquberJqqDZJBKwAoiWxMlmn0NZgb4cI+p7WX5qSgiMA3eyRLCnNmpPRB6hjDagGzI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+zXLQ8a66yo9+fJbx7u1C0uCTxBTLbLzlCig/XF9HHpfsZp9hm
	qt4jEEmEXX5X69C6wPxM40C+jmESZcHAqfk8p1KZOfv6d02ogXKJHV/jkfq34CsyODsJuR+5Y5q
	4PBhtM3hTzVJM4HJ180THSgn7nOjmRKHjLSIhNEq6
X-Gm-Gg: AZFdTZePVY+fI/FwBsPGmjSwFoTdJBOjOhixo6Kzm3+bzO9qXXzvbJ8Hyo2gcIrBM2t
	UDI9KvabPeihDMk3wDeWanI+c0wT4KHNODho3aSyGhPxfc1R1ekmKLbX+VnIbG/EwzLNnlGInY4
	U9dRHk/3V0CkoaaeS4rFd5bT7c5AyUhn/iAmMJcDfCRZpDUjmEGnI9PMGHIHF/VSenOmNmFuayr
	v0jEHaAgV6Oqda1lUDr9F7/jtC8OOi7Dy/EDFLYGG0vghK3HV2IK5SWBkQMkcZXClIOkeEogv5f
	TYo5rTaccTf9Bx9kd+gEVsMklBbY0QXWZmWIpj/A4QmLxOAvpCdqq5kQX0RSiLG7sjWFamZ/mL2
	j/yZ+bxwb8k2V7uWmXpvgG02fPKe9i40szYTKBmyrKBsZnR2uyDCTxJe60rrOl6yTh/gwkA1BUY
	JeyRxegPNthIGwiVGb2iBcNKGOWfZe+gDlzUT2mf8/igsSIg==
X-Received: by 2002:a05:6000:200c:b0:490:411a:1eed with SMTP id
 ffacd0b85a97d-4a63d2cf93emr11007405f8f.39.1795078392254; Thu, 19 Nov 2026
 00:53:12 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261117-formatter-lifetime-v2-0-e216d86ffb57@gmail.com> <20261117-formatter-lifetime-v2-2-e216d86ffb57@gmail.com>
In-Reply-To: <20261117-formatter-lifetime-v2-2-e216d86ffb57@gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 19 Nov 2026 09:52:59 +0100
X-Gm-Features: Aa3M54qWXf-BecwMhD33FC_LoK5lSzu5f6uP1S-mq1j8HfpLtedDHeIgEaf3kUU
Message-ID: <CAH5fLgiye2b7qVDLRgi1rZaOKvVb=V2u-XbrQEH7PtB78+9V_w@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] rust: str: add an example for Formatter::new
To: peder.bergan@gmail.com
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org, Georgios Androutsopoulos <georgeandrout13@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 17, 2026 at 6:57=E2=80=AFPM Peder Bergan via B4 Relay
<devnull+peder.bergan.gmail.com@kernel.org> wrote:
>
> From: Peder Bergan <peder.bergan@gmail.com>
>
> Document the exclusive buffer borrow held by Formatter::new() and show
> formatting into a live buffer. Check the number of bytes written and the
> resulting buffer contents.
>
> Signed-off-by: Peder Bergan <peder.bergan@gmail.com>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
