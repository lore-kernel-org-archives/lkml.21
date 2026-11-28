Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=159.226.251.25
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795848909;
	b=fBA+6JV47BK1DFuJ/zQL4bQy+1+Ak/oDddTZPfYZBYSqfbuGChQBexGP+aiaqfP5huNP
	 MdhfjkSgc7u429RxjHZJMkrC1SO7G2xNnIcUuWnuJ/GomZwuoKEK30P1D3KCZ685ghwll
	 flhTNjSUJi4RcUANw5GqU3FaiwcDE3ntcmBXtKQqRNN6TwlCbWkS+9E1enCATFnnR19EY
	 YvDC7QuTkRcVPYbL6+ATPNZPFhutRuLmuHhrXoZUgHWK1491Q5OXg/BZhWUbmdCHbkoTo
	 G9MSU9SFlZ6/uDMcrWdDpfHsOwq+mQA37N1cvjiq5asWSP7DZ3UsDCwP7fcVWKhgWVQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795848909;
	h=DMARC-Filter:Received:Message-ID:Subject:From:To:Cc:Date:In-Reply-To:
	 References:Content-Type:Content-Transfer-Encoding:User-Agent:
	 MIME-Version:X-CM-TRANSID:X-Coremail-Antispam:X-Originating-IP:
	 X-CM-SenderInfo;
	bh=4FXjnvyE7FmuK6O5ohm0uEqbLRgpgkKLfYpucSLO6vI=;
	b=pIUNkDI6y+/z4Mhbc64oJW+qqsBzQzd7n0vsn6xNHyvEQslVjocZ1MwtoBaLseJquk7U
	 WC74kzXhgMd5LtKpSUJj3oHMoxE3oEOgz+2ISuDwPvm9txPQYJ5pVj7Ip8yrTo+GjP1KN
	 UF/ZY9k6HRwmfFvd5GjdTyCWk5RUA9WQ/LYsTmvl3IpVl2efzPWesA99ArTX/IdXcaW/2
	 G7YUXS6iJDfHu9RHaLANKEiQcfMgIsf+Uxoub5r1mrx1nUmQO/b1GdLzYUdpsPrIUalSw
	 AWBGua/LD5MEOy5/UZDcWOxX+Og9GZ5pxphk4sEgOk8hRBEPpZF3/RhsaAE6mAMlkJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=iscas.ac.cn;
	spf=pass smtp.mailfrom=iscas.ac.cn;
	arc=none smtp.remote-ip=159.226.251.25
Received: from cstnet.cn (smtp25.cstnet.cn [159.226.251.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49C48606A331
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 06:55:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 49C48606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from edelgard.fodlan.icenowy.me (unknown [112.94.102.207])
	by APP-05 (Coremail) with SMTP id zQCowAC3TrTDegprlgwlAg--.40017S2;
	Sat, 28 Nov 2026 14:54:59 +0800 (CST)
Message-ID: <75bc19099b4f2c7384891621a86206c31071ebf5.camel@iscas.ac.cn>
Subject: Re: [PATCH] MAINTAINERS: matches th1520 in filenames for RISC-V
 THEAD SoC
From: Icenowy Zheng <zhengxingda@iscas.ac.cn>
To: Drew Fustini <fustini@kernel.org>
Cc: Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Sat, 28 Nov 2026 14:54:59 +0800
In-Reply-To: <awpKGGPVJawHTK5E@thelio>
References: 
	<20261126-th1520-maintainers-n-clause-v1-1-c1315e68e5be@iscas.ac.cn>
	 <awpKGGPVJawHTK5E@thelio>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-CM-TRANSID:zQCowAC3TrTDegprlgwlAg--.40017S2
X-Coremail-Antispam: 1UD129KBjvdXoWrtw4Utw4rtryrZF4rtFW5ZFb_yoWfWrbEkF
	WDGrn7Z34UAF40yw45KFn5XrZxJF43XFyUXry8Xa1qvFW5Cr98Xa10k3ySq3W5Jry8AFZr
	CFn5XrWrGr1YvjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUb2kYjsxI4VWkCwAYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I
	6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM2
	8CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVWUJVWUCwA2z4x0Y4vE2Ix0
	cI8IcVCY1x0267AKxVWUJVW8JwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I
	8E87Iv6xkF7I0E14v26r4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xv
	F2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r
	4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCY1x0262kKe7AKxVWUAVWUtwCF
	04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r
	18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vI
	r41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr
	1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvE
	x4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU8XJ55UUUUU==
X-CM-SenderInfo: x2kh0wp0lqwv3d6l2u1dvotugofq/

=E5=9C=A8 2026-11-27=E4=BA=94=E7=9A=84 19:27 -0800=EF=BC=8CDrew Fustini=E5=
=86=99=E9=81=93=EF=BC=9A
> On Thu, Nov 26, 2026 at 05:53:32PM +0800, Icenowy Zheng wrote:
> > As more and more device binding / drivers are coming for TH1520,
> > indivudal filenames now bloats this MAINTAINERS entry.
> >=20
> > Use N: to match th1520 in filenames instead of listing them.
>=20
> Good idea, nothing drops out, and thead,th1520-dw-hdmi.yaml is now
> covered, too.
>=20
> [..]
> > -F:	drivers/clk/thead/clk-th1520-ap.c
>=20
> for clk I think it would be better to list the directory like the entry a=
lready does for pmdomain:
>=20
>    F:	drivers/clk/thead/

I agree with this.

Thanks,
Icenowy

>=20
> I can do those fixups when applying if you agree.
>=20
> Thanks,
> Drew
>=20
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

