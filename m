Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795089082;
	b=HV/JjEKlUCAZXs7IcS2Er5OvFdtS7q0tJAEAYAQ4p6si4nBOyTJnHaPyObc4rbHEOguU
	 eZGS8I1fJqhVJSwjqHP70rF5l8lsfjh1g8wUBUsFLdNHVhOv47DNC5dkMohM2wixjGVM9
	 7yd03tiSrQR0Jk9vgrJCydKMuDlNwmsT1o6bWav8TbE2qyGXOCOdDu6ScdyywzTC8InXL
	 R89xzdBZjeYUgJ20L4IoiPEeCWeLGMi6fVVFCTEAkT2UDpdLlL9pn/B5a+HDXwl2V7K8p
	 zogIyiwjnGY/hnWIqmq7KN4FcnxQ2oxbBiVQMo0exxyQ6uZfUmDkBZ68mMwnZTXEvHg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795089082;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=2nIoNXWOUAVdWDRzGFpmLJqy+h9+tgXL9koPRtHTTIo=;
	b=z2XbcEhUAJt7e64q95s0IZiCfftLeaX3aP5jp4zrK1ogRvBtjV1ouGi7yyMyassRP4PH
	 LnNb+cDFhNSENJRy0D0EMP5i4oVR2I/HR7uDRxDruJuAaBUrswS2s+uA7HwSfwosSK8W9
	 48aBu4fYlBrSoi/x5PPF633ot2vbXfY//1s9uZq9FVnAnghkxmRZBRCaeAf9u5/A/lOnr
	 ue73DQvL1RW3RIvsOrW7eD3sYAeRZTSX5VpwBg9lzrV7MXmj3fhvPa4KIjYxkC5KMMwOf
	 Qf7TXGJngCGSbSWwcO7bbBwg23tbuyCAUFtQHJ1r+lY0DssUkEtXbtc+cIaJwvLTQng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=HXGXImHs;
	arc=none smtp.remote-ip=91.218.175.182
Received: from mta0.migadu.com (out-182.mta0.migadu.com [91.218.175.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F4174606A325
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 11:51:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F4174606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=HXGXImHs
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=2nIoNXWOUAVdWDRzGFpmLJqy+h9+tgXL9koPRtHTTIo=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795089079; v=1; x=1795693879;
 b=HXGXImHsmUKRyCJVzfs4hgVRIceoWSAWK0KnA4H3Al3VntL/dXUjQ7gVS632EplLqafnqLLq
 D+wFZt7mgebrUgYExZPCEj3F6tLlaSf0e/A3CltPO5XBLigqq/0Hd8fEIc+HrjbOyq4im4U+Wqo
 P2D9cPbdc5B+ayqW7e6q40d8=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 4f6a7273b786426d;
	Thu, 19 Nov 2026 11:51:19 +0000
X-Mizu-Trace-ID: 4f6a7273b786426d
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5c14bc5a743so7541e87.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 03:51:14 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErEcvujcus7o5We0sZ3gnWXdbYyvp4U3xChBv6lFqRvg7lPzqGdrF59QoGqumrmqia4ZBLb5jM93Z7+z48c=@vger.kernel.org
X-Gm-Message-State: APuU4Z8nNoCYPUPIIXzLzxtajeL6mWTo/8zHTjtpj8gHOsnfskPC/TYq
	B7giyKWYWL3sO18A65SMpkDTGkw+eQxcPGGLtXf06enB2vsVN34GFWvFLqe2eziqkngZOjngOqH
	nAcMfBW+9QgJt4j7j/NOeRLVMrC7o6xAiIK53+pYW
X-Received: by 2002:a05:6512:2249:b0:5c1:ac5e:ee43 with SMTP id
 2adb3069b0e04-5c1b4d8e751mr72133e87.3.1795089072968; Thu, 19 Nov 2026
 03:51:12 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261118-host_gicv5_fixes-v3-0-13c1859e8aa3@arm.com> <20261118-host_gicv5_fixes-v3-2-13c1859e8aa3@arm.com>
In-Reply-To: <20261118-host_gicv5_fixes-v3-2-13c1859e8aa3@arm.com>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Thu, 19 Nov 2026 11:50:36 +0000
X-Gmail-Original-Message-ID: <CA+EHjTxyzmrs_MmyR+mgd2i3o+WsCJXUDeFYMazx90HcMsRpcw@mail.gmail.com>
X-Gm-Features: AclHuK-9X4wNiG1y-xKQhxxJly3ETEK_fLVXFOqR8mr1PAHRi6qTd8jcdmWzIk4
Message-ID: <CA+EHjTxyzmrs_MmyR+mgd2i3o+WsCJXUDeFYMazx90HcMsRpcw@mail.gmail.com>
Subject: Re: [PATCH v3 02/14] irqchip/gic-v5: Only set IRS DPS when 1ofN
 routing is supported
To: Sascha Bischoff <sascha.bischoff@arm.com>
Cc: Marc Zyngier <maz@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, Timothy Hayes <timothy.hayes@arm.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Jonathan Cameron <jic23@kernel.org>, 
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Sascha,

On Wed, 18 Nov 2026 17:35:31 +0000, Sascha Bischoff
<sascha.bischoff@arm.com> wrote:
> IRS_PE_CR0.DPS is RES0 when the IRS does not support 1ofN routing.
> Read the capability from IRS_IDR0 and skip programming DPS on systems
> without support for 1ofN routing, rather than blindly writing it.

vgic_v5_irs_set_up_vpe() in KVM writes IRS_VPE_CR0.DPS unconditionally
too, and that bit is RES0 when IRS_IDR0.VIRT_ONE_N is clear. Worth a
separate KVM patch for that one?

Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>

Cheers,
/fuad
