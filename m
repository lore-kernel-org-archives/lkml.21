Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.208.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1795583216;
	b=PvRG787teCvf5Ana1Omma802OX/wEUzYUPd11hYngYQKDLTE87K7oAtbgAX21CcFy7x8
	 ITvsSxKhFJjj+8gohuYSWIB4huoOlIlqfmaKPivJKZ2S3O93nHsiuTpb6O6B1mUgEB+VC
	 yy/vOna+Nee5KQyFNC21+oy7f2Ccf2MXOXQrxTDaMOQQw5bTF/KvcGkfC6V+mX8B9qB84
	 qgtvTnfgeFKt7erlwF4QEFbSy8hRwd3rWUv+cXsZGfyxIX6srOmfSEv0DC/EvFpi9xt3N
	 x+S8HKuZ7CuDXxyy8diEJv2jIRGVTGS3T/8y8hE2QSbN6PW0OTyZQdPeFopAeti8PSw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795583216;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=St9qGG3raKOdkDcDbquwSocgYR27/42BAaGi49zTWXE=;
	b=C24KbDcUhNKiIegvb/kzwQzi10GkK0H+VIKRg7RRLg5Y8MoWqaCp1wrHytZHw/QhitUc
	 Y3XtEge4Ui+Db1rGyg9yjhXkErQGhiwpX008u8O9t6SmTpyK8aMy7PeySN3BV6s7/zSmG
	 vaVOwJ2M/1yavI2MtNoQLERLVm7hsE4oysT5bYfzRtKtBv5xIf7tkbahq2serbXqk5zqJ
	 c//mFrKlU8CFmKoM2ZScN+N9ysdFCb7mi3kjZnpnw+l/oYsqa9mx577VXAMqvIYf0Hga7
	 oMAA0iV5ju4xB9HKZf+kimXcxkp3PDAYFGrRF6TS39Vu+99U1oCfv+xP+6hDamyEkBw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=iiitd.ac.in;
	spf=pass smtp.mailfrom=iiitd.ac.in;
	dkim=pass header.d=iiitd.ac.in header.i=@iiitd.ac.in header.a=rsa-sha256 header.s=google header.b=WvCW1Bg4;
	arc=fail smtp.remote-ip=209.85.208.42
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3B72606A326
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 05:06:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A3B72606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iiitd.ac.in
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iiitd.ac.in
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iiitd.ac.in header.i=@iiitd.ac.in header.a=rsa-sha256 header.s=google header.b=WvCW1Bg4
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6b167ffd132so8210301a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 21:06:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795583202; cv=none;
        d=google.com; s=arc-20260327;
        b=VlUVgzjYyfg1tGkYdn7/6Kr+RD9p9pz9bJIYyI51I0pyDQE9iY8yj8bciUVTP5zD3t
         bmXpEEsJCl8HpgtPbjGmi5WdA2xOogSDZPgw6eA1Mc+DNpT3g3XxluXZdzae7+OsrAb4
         RDYLbz6Qnotn0FCl2eWLXmTd79HxmdAQjctCxfFe3beRMcSTz6J2ZtmvExa/HyMXsh1u
         k0xP6LkxIksHLEoxzJpHKMwD4tfVFCNP6/BIKGPks2aWkbm/lfNzxlcGDVzL3BvHOrf9
         ov3AsVBnYbPjORy9QhWUaY6F0WrTJNW3paaagm2tMndV3M8r3++oOG2EXG0ASTr3bVn5
         KM8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=St9qGG3raKOdkDcDbquwSocgYR27/42BAaGi49zTWXE=;
        fh=fFMwCl5CDjCdY4C7gt1GO3k/ewr/vSV1P0f2f3t4QWI=;
        b=lZ3ovToboWA5NB9yw/ZL6iSyzxq7hfs74ymq3SNpmZjEc3x48MBLpe3TcYsjqS8zmT
         nmbJuGdB+Ymr+3g2NzVGT924Rwg2dOfGiKW0a8YovdVbwLZC+ickeSqfini8G4vXam1N
         wl8iTKVZaq9GpgcjDrsgG0pGZ6HbZ32lyaUAmu5wsgswwRSs5a/Zfy7u5GHWKkRNAodl
         wbE6+WjISQdJwQEzM13m2UR1klxo5hhyQeyJKvetA7rrvIcXxVrYd2FKKfwSW7xqHK2y
         SL1d5dx3qzDyf5YFTa1HkasFHqZDGCOj/WqFPhS430eToCulQ7YM0A+joKi6lgSnixsJ
         Gh9w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=iiitd.ac.in; s=google; t=1795583202; x=1796188002; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=St9qGG3raKOdkDcDbquwSocgYR27/42BAaGi49zTWXE=;
        b=WvCW1Bg4ViJubZeAEI0wYclnYXwKcIfPWWaMc9ZYTHNFKwJAVdCHcNiTzHn6PetD/3
         myrf5RFaZ2plYTw8GPMbuKPDxhjAr/O539xfOwB3qv4OIeo/63IuHPGAvb6uMnWgI4DO
         0LoFQkv5PtCnVQ9jmUSzUtB/4qlHMRW3ijYiQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795583202; x=1796188002;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=St9qGG3raKOdkDcDbquwSocgYR27/42BAaGi49zTWXE=;
        b=cs695dsL76Lhm3BJh1xOnhlLDPm5g5o1K+bndR8q3mdvEvYCx9XF5mf02thAzLvK6R
         zAi+A510DaA8O5o2qm+4us8HdzJ+fxV29x4xgAjyp0r9nX/WsoJHOU+cLeSjAZ699oVr
         CWx3ZhjE71iOHr16VADYLI6IY/s9pO+JgpKIABKT07XOxpLbl74/mKh5FGqoFjbpo/f0
         5nZuMTuk+/tZVmDeis0pQ3jgwr8Nw7xGAEY5w1Gy3B/Pj3O36TvU289Tyv6Dpf8NTbjP
         jnzZIzrGzzf0e66mMpBpek2IMVGpCJLSkMXKh8fyTHHhufsk1QbjxMETWF+2pY3UfiqU
         5jOA==
X-Forwarded-Encrypted: i=1; AL+hErEbamXXCIWlL25HY86hu4tiQGoyhj6EQRBf/CRK+W2AMmG2/gZsnspwecnIMvpaWOHd3Z8vmHDzGcVI/+Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z8EHAC2BEO6YyeVW1yC84yFfpTKXspr64KsoSvvYPYKvkPeGWRi
	XrvPAWElbwYEsC3nZUG25dDutFdkwHkSGVtPOcLkNqtcDKMRScq6Ul9i4XXYI43rX66HQksI38a
	Sr0n6h2qACoeRJm3r0AO1AqNTXvkO+22bmhtNFaOIDA==
X-Gm-Gg: AZFdTZcD5CL84vdo1LtQ1kLv603jD9ioa6DC/z7rq/e47dT49m4eBPAQEmwvp84tEdI
	3P3TMBj4nuLJ6h2IczVmvFW5fxGPILmMGGCrYH+qK8/+C3CFR+s7PWxf/2GrNCeNFdSbiG3gGsl
	mpaIIqi6E9MNn4b8bzTpnNQH3ObNinT3vKJFeHqktDcgtlR7KIjvalEZCwB0f7JGDcE2xPyyt6/
	rUWFvEFjeJdaVaghzIjI+ppyzIwpfVssyy7St6EL9gTa1W0EcRtHmMxE3R4eBCrBdWuoFRvb551
	Ki9jqsgma5K1YI/8BcFMhcPUknwd8zpJWh8JL1JZ5M9zFM1I6ft+tCCl+OG924UGVnfaVWd6+uo
	UHSNMXmYFfKY5XAl3VGvA/zFMu8gEHN9qlfcH7JoQKL+PpPiZVJORe9tky7v5Dk7SWN/u3iAozi
	xW+xcmR1DCn7/6PpUDx1TwbLOCf5Pd0Wba2J91zdN/58hBIWQweTGpTh4=
X-Received: by 2002:a05:6402:504:b0:6b7:1cd4:87d6 with SMTP id
 4fb4d7f45d1cf-6ba37d17fc4mr8799911a12.13.1795583202056; Tue, 24 Nov 2026
 21:06:42 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261125043847.885053-1-piyus@iiitd.ac.in> <179558178888.3294.13943698848591637747@kernel.org>
In-Reply-To: <179558178888.3294.13943698848591637747@kernel.org>
From: Piyus Kedia <piyus@iiitd.ac.in>
Date: Wed, 25 Nov 2026 10:36:30 +0530
X-Gm-Features: Aa3M54oDWglR0iAUavzHNeiehG4Hg13FhPc-XMGjpMFLClMWzn6h4NFTqVwgfFs
Message-ID: <CADq=QSx-7eYx93XbdGLTxHp4-O-=gO_6VyS6R4XgZzDXMG_ErA@mail.gmail.com>
Subject: Re: [PATCH wireless v2] wifi: mac80211: store the mesh IE blob's
 length without truncating it
To: netdev-bot+sinfo@kernel.org
Cc: Johannes Berg <johannes@sipsolutions.net>, linux-wireless@vger.kernel.org, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Kapil Vaswani <kapil@presceralabs.ai>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi!

The bot is right, and the information is in this posting - but under the --=
-
line, where git am drops it, so it is missing from the commit message itsel=
f.
Stating it here as asked, rather than reposting:

How it was found: by AI-driven fuzzing built on top of syzkaller.  A genera=
ted
program put a vendor element followed by an RSN element in
NL80211_MESH_SETUP_IE on a mesh interface, and KASAN reported a
slab-out-of-bounds write in ieee80211_mesh_build_beacon(), reproduced on
mainline 7.4-rc3 and on 7.3.1.

That run is what found the beacon-tail overflow fixed by the other patch of
this series, "wifi: mac80211: do not copy the mesh RSN IE twice into the
beacon".  The truncating "ifmsh->ie_len =3D setup->ie_len" that this patch =
is
about was found by reading the code around that crash, and by the review of
v1 of this patch, which showed that v1 made the overflow reachable rather t=
han
fixing it.  The two routes the commit message describes - a blob length tha=
t
is a multiple of 256, and a 257-byte element behind a truncated stored leng=
th
- come from reading the code and have not been run here.

If there is a v3 for other reasons, that paragraph will be in the commit
message.

On Wed, Nov 25, 2026 at 10:13=E2=80=AFAM <netdev-bot+sinfo@kernel.org> wrot=
e:
>
> Hi!
>
> This is an automated message. This series looks like a fix, but its
> commit messages seem to be missing some information:
>
>  - How the issue was discovered, e.g. hit in production, hit during
>    development, syzbot report, manual code inspection, LLM or static
>    analysis tool scan.
>
> Please do not repost the series just to address the above. Instead,
> reply to this email with the missing information, so that reviewers
> can take it into account.
>
> *IMPORTANT*: If you do repost (for other reasons) - please include
> the relevant info in the cover letter or commit messages.
> --
> The evaluation is done by an LLM so it may be wrong, if you think
> that is the case please reply and explain.
