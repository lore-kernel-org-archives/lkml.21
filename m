Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795005778;
	b=LzWYCiND1LmSqi4B6OOtKgnzRy1C4tQD2gYz6ieaK4azaZlvkYlYLQdErVnfQSr8VSeR
	 oE7OmvZj2BjOhUuZftWq+r5TEvWO/Ffcfkbi+uGHHJV9GA6KWYhFUpHcLVJFmHxamvO5X
	 KMAPYwwYm284u/xoC8FR5g/n5PeucLUrzWSXO3FxyUh/6m6jRxm9lfr8hrUxbMG4R7DsB
	 ZEgsJGwhOneuH3ZuXFEICefI6RJmj4UvBesNHp2oNjPGEOMpUaaa6chjuAfJgtXFSa0mT
	 PkDy7ocWl0WMM59A70MFC/sz6ov3rltZOfz9JgC5gstmSJAMmdEB9HY99YHvlnx3ghw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795005778;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding;
	bh=tu4WQsRLgMJNCrYncFACnd8vCyNNudt+UvD0tk9IHEI=;
	b=ElHwMwKDq79hLexusf13gvAryI3apEOx03nHeip+zkAUOHCbbDUfPT2R1lsUvs2JCH+6
	 dSlrtaY9jqgJYbeSzOezLYAiFIxpqTg7dfyB6ziOsOUH2+Ta1xDxTU4QsKjYUgdQj3nU/
	 Conp8zKN8vw9XWgr5u6mq5h2SNvgrK368xwLvT6OGeMHjw1DXMoAYCAX86Z0pohA6uV86
	 dsl3Vh4TRiswM54T4ZSMYKYsuom8gr+U9HpTQMpBx+bRkUzLGJqIO3+DlXJQammFXp+y2
	 xP4y4pRQ+UxFCtcfS6b9zqsM2dihSFSodfaSNIaXBMEpH4wk+IVtgJKeRvP2HbT3Y2Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qcO03lPw;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.51
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA8A0606A336
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 12:42:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CA8A0606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qcO03lPw
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6b587538a37so1366378a12.2
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 04:42:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795005776; cv=none;
        d=google.com; s=arc-20260327;
        b=Ut5zuyJj0vsdt5TK+nMg/brmhd5I2aH694RzHPDqLqmdInNtGTQF+Jl2TJuirUNrHq
         aE+Uztr+FOg4tTBSR+HyGw8HampQiDXEE6iQHdsm2My+q7Jcp+hwc+aW7sZPN6sdKBVI
         DcDQasqXFHtKU0dMFt0GLfBSF4Ll7rQXompHAVn9SxnBUlOX7TBKJtet2PABBBPoP6cL
         yzW2nIh1WTWizGMbPV0f0c6o69+1Yn8pq58Td/kdh8vCHpH+v1FrYTwx342UHtNsn/Dk
         104XN3gUPoujfSrTDJ1GA1oVCIPQCiL2fSq5zb7gyOE/Wq78CLmZ6Bb1UZIAs4wj74dH
         B0HA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:mime-version:dkim-signature;
        bh=tu4WQsRLgMJNCrYncFACnd8vCyNNudt+UvD0tk9IHEI=;
        fh=2tJSq8JZMHsp3QfA1ET31+JQLESWuFbfEYCkt7d9vQU=;
        b=enNjDJaGb4uHXd2moHkcdgD4H9oOEC2i90jVfwc1DSImS2Pkn6TXIYzyFANdHpc9G5
         FCEhA09QMb+S9tqVol74TFKVef6xWoS99Og23oksUVd51DNd1998aFcTpXhFu7x/MELl
         EeiAzD/2kN1o5MZgRoFQ/lIPXAkZxIYl6RCXCJLmKE0mcHQOsQIE98mUrSkjYjt8GGGg
         /fKlBeOSu6GXrW/9g6viC70EChaZXOVERafU6a92phleYc1AzpVeTGWFneL2Mxo9LYSt
         8eHIEhrPV9gMlPBhq9V+nGbKxPJpDqQWAK4hlZvRlw59eIeKMdH2OQfDfkNKiv4b97gA
         znkg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795005776; x=1795610576; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=tu4WQsRLgMJNCrYncFACnd8vCyNNudt+UvD0tk9IHEI=;
        b=qcO03lPwu9LuKr0krp5dfjHJOP0sWF8HTYWGANLS1W/cjnUrYMGWj3krs6DlpUamQZ
         Smoe3Y8oR4zYCcjUYcLMdUbL7VjroxBYLxxtDF4Ql+AIMIDYNPVboOI63sSfC/p8WPCQ
         r+2SkTRyAz1s8+CBStHQ60ovxMMoVKYTUz9q88BIkBoVqdSu5oCaRV7gdF/agCXbncVb
         VwJa+bDYkD52JZUcBypfzc/2PwzPo/miT3Q52ii69kpplHbbowX/sK++WHFq0VpXt/Pj
         Da6kW6rzDQFYgAqnv0dZSOASsvRorYiLEtezfvvIQRfDI4gSn803ki22NVlH3rWW/jJW
         X6xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795005776; x=1795610576;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:mime-version:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=tu4WQsRLgMJNCrYncFACnd8vCyNNudt+UvD0tk9IHEI=;
        b=f31cE54q+x6NoXvRt5g7lvzpHSv+b2czEDLSSo151QziIyzaddL5Ekk4htgS3hDdWE
         C7mWYaEA5CfyI9PSVg03PzNVkTN+5pqdPFOYBeTYkNifa6wlKJpa0HdlLFgUe0Biu/2w
         /3rrh33+ZXFNwhDxUxZC//S8GnzC//7qycz5KCidELLrHzff+lZKGPnmyHNACnyhYvks
         gSVUqryENw40dBZndBQRIaHii9bWiatET8wU77NCCWGwzmVxoR5jeYS4DIK6sRNtKIc4
         H7QWEHojYAVquMJkba61c34wddAp0wRzNf/FYi9CEP/Ti48oKywF2PnfYM+xVj9SmRtU
         csRA==
X-Forwarded-Encrypted: i=1; AL+hErFUaRCL6cZQv1QYvOwXAcHQ2Fwu5xz6f4fDsUZkZ/p2oGwKJ6AGvyebsO1qVb4OorNGSsIX0YtNL4ekGiQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+TrlYoEMkyQm1rbEExYbex1FjTozTNBJ759xjBvbOPHmVJsnPC
	Cl4Gv9HKbf/kw4wUMkThPQ6As6TyEfLi0EIgzF83vPxychMoZDJc9zhw1jUTF6sy4Q5yaLJPgCS
	GI2bcQRDFFAVsT7S2qdh2E5/jd6/r2aw=
X-Gm-Gg: AYBFou0OnMGUpv8Cp2cmpKaWv3CrPP8KAt+MydoTId+LszYIy6BvGsHni6A69z2rHYf
	esEgsirIj7zOforVhF9sv5yc/cxgaX7a1NR1G5puzx2tOqPxiRkdzfCAoCgrFoRNkKd/5Rk7HKl
	RRjBWDmfjvStE59PwtO+L9y9IKhhrrGb8loJGdfmPc6iyLpe4fONqPEGCsFn6+apfTOJBTn49ey
	hW8LJHZLvb2naBkmLGdXEziOcWJOiw9q+SockbYZADC7cCgyzdZMsdFRV7IRNpgJyBM5d+HxTyx
	f5lWHA/wZeoFmXafrnQYjA6nfftMBejgj/1xcOLAIDR4D0yAn7nCzf4rBC/lteKN4kJTQqE4DGT
	Ilkvj69WyCmemMUVOmDtycmBpOEsBl+ANd9pS0UqNj31AXp91CuS8uHOGrTPI4JBmMlzkU+BgLa
	oS3U/hoq/li88HX19WRiS2njuHfPSCIvmXPfFWELHTB1SXtbDy2u4CnSVFdYE1X5Y9B9x5CJwW+
	lA2
X-Received: by 2002:a05:6402:4504:b0:6b5:7770:ce2d with SMTP id
 4fb4d7f45d1cf-6b887f21f0amr1932132a12.26.1795005776013; Wed, 18 Nov 2026
 04:42:56 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Reply-To: ludloff@gmail.com
From: Christian Ludloff <ludloff@gmail.com>
Date: Wed, 18 Nov 2026 04:42:44 -0800
X-Gm-Features: AclHuK9CtLBvDfSZS8u-mbj4wWauHAFcNWfeQbnm5RFPnJDXGikoy7UxbQ7nZeE
Message-ID: <CAKSQd8XBwW1h9YCo0yhw1shKQyD+NdFZqN-0-55nEhJ+NMWJLw@mail.gmail.com>
Subject: Re: Re: [PATCH v8 12/20] KVM: x86: Support REX2-prefixed opcode decode
To: "Chang S. Bae" <chang.seok.bae@intel.com>
Cc: Jim Mattson <jmattson@google.com>, pbonzini@redhat.com, seanjc@google.com, 
	kvm@vger.kernel.org, x86@kernel.org, linux-kernel@vger.kernel.org, 
	zhao1.liu@intel.com, andrew.cooper3@citrix.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

>> Does hardware raise #UD on 0x48 0x66 0xD5, or does the intervening legac=
y
>> prefix nullify the REX prefix as in legacy encodings?
>
> Yes, it is nullified and this behavior should be preserved, I think. I
> was also able to verify this on an APX-prototyped system.
>
>> The text clearly permits 0x48 0x66 0xD5, since the REX prefix doesn't
>> *immediately* precede the REX2 prefix. The table is unclear.
>
> I'll pass this documentation feedback along to the relevant folks.

Fwiw, EVO processors have MSR control bits for this =E2=80=93
#UD vs not, REX/REX2 bits merged vs not, plus more.

--
C.
