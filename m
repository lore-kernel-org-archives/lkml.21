Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795294892;
	b=zu3Ig5MeDCBHPtwp04Btjnlv0DbbUxoNjDssN1IiluFDyKv5HrUE6vn6b7gqgR8JjX6e
	 oJFnZQ9VCwvYxcZYT2OihdHShXwUCslZ7YzJSBvqOZMJnpkOWNoL+uRyulMGEMCXNVGyJ
	 lWboJ8xQc1Nezky7+pNnxv85Q+xne8LodVqG/GxVqSJHVKA+4LY0WJ+9BFn1KjLiTiqnU
	 2oc8cx2WYdm0ssjrVnggQcNZnRaUOQLlC1RhMfrR+xIkmvJXVeRX7nPsJjqlmpu1Yi7Gu
	 Rj7E9ulXHFn008jQxpp4dsbdDNqP9rFXVb9gi4U9Xk59rRYhqhvxj+LYo2qpiSUSNJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795294892;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=v8vAHChTalJyPKJWjYAU8hJ9rNARiHKrkluyFMh0zh8=;
	b=R7SsxtiLujc769Zvu+Eve5Tydqoa768r0RI4Y1YzCv/iYjK+tLK/Ux0ImXdc7nc+EC7v
	 6asCpmiTGNC8ud/m4Fm+YjwEHI5Z0Xk2N6WqCWiQLDMRN8tdTUs1Lu5tSUPD9n4Q3z45A
	 yMFkbRmy9HfPqDy1sfRNzSknBtQpXFU/LBPeqiaeNTDpjxkVuf/NdTYBf4gWSd4Dg82si
	 uavAKZy4VQG1iV4Ds5z59rTVt8aYdq2OCRO4aNzCaW9QoGyZfHofSPjYaZ3PnnKQTjqId
	 b6/U3o0i1V2kHS4RKK6ZBqPNaAETD8Dc7wC59Avlqot+q6ge1UF0AqLJO8/4mXcl13A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PhcIcnDa;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F46B606A32C
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 21:01:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PhcIcnDa
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 149C61F000EE
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 21:01:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795294892;
	bh=v8vAHChTalJyPKJWjYAU8hJ9rNARiHKrkluyFMh0zh8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=PhcIcnDahk93XHX6nhVEyhzqPt5GML6+Zl8sQA0Ax2ohQ+5IT8DChhIUmK2Pn8qZI
	 pL6vyZZfGf9NWndz/ufGc9Y1eByB3h8etOTfGTkfMSB14pW1UtngpOIf/rL3RurMv4
	 a3fppe2SppuOI0uPoRo1NIUjKgbuBrQFlp/nxdkIUd56noxL6pZIFEtO60X9maoWoW
	 73Hr4fogCGQaWM1fmV9oJJsbGa7Lyz62RAEXQH7L0uBL3cYCCAJvOvYkoQLcXZawdV
	 1pv/4CFES8fTRs0t/4hf4Zr9LAsfZZwq7PtHj8AXZ8qNoQa5KhmxDWzWoeiccEJiqf
	 58mjFX/aM/xwg==
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5be47aa555cso2479980e87.3
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 13:01:32 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHrMMt0Qtp8vlw4j/dhuGWf0DLMXtmMZN7Dr+2pZ3sx3+zI4NugUwI5vsQqanRVZOvyiygqWucrOSGLVnY=@vger.kernel.org
X-Gm-Message-State: APuU4Z8+jZ/dMzwgGBH4rjmgmlHph/BtLMpfCW/vWzxxzWYqFT3AxZN6
	uOhisiFDVShveQm08mahSaNcQeezkwN+IZSCPNoJBTGKIbkOLdIwkYlG88u0+QhSJoZZzKvubWt
	+DvPiEUlSMNCRCCE89vaVrQFP/triEuc=
X-Received: by 2002:a05:6512:31c3:b0:5c1:465b:ebe3 with SMTP id
 2adb3069b0e04-5c1bc7be4b6mr2356062e87.13.1795294890748; Sat, 21 Nov 2026
 13:01:30 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261015142552.4128028-1-ryan.roberts@arm.com>
 <20261015142552.4128028-2-ryan.roberts@arm.com> <CAD++jLkrWojU3FeTPGOCFHHsbmTGYG0Tz3b2nrn7mMfsDssCQw@mail.gmail.com>
In-Reply-To: <CAD++jLkrWojU3FeTPGOCFHHsbmTGYG0Tz3b2nrn7mMfsDssCQw@mail.gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Sat, 21 Nov 2026 22:01:17 +0100
X-Gmail-Original-Message-ID: <CAD++jL=fnRBZJ-H8SMbZDr_1-F-aRbq6QRN_ZqaKw_M4cJFBOg@mail.gmail.com>
X-Gm-Features: Aa3M54rcr2uec6946c6ceFg_f82syIk8ikAg7SN-MP8cTPlIYobsjIq52BzG5Cw
Message-ID: <CAD++jL=fnRBZJ-H8SMbZDr_1-F-aRbq6QRN_ZqaKw_M4cJFBOg@mail.gmail.com>
Subject: Re: [RFC PATCH v2 01/15] misc/arm-cla: Add driver skeleton and documentation
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Alex Williamson <alex@shazbot.org>, Jason Gunthorpe <jgg@nvidia.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jean-Philippe Brucker <jpb@kernel.org>, Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, kvm@vger.kernel.org, devicetree@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 20, 2026 at 10:47=E2=80=AFAM Linus Walleij <linusw@kernel.org> =
wrote:
> On Thu, Oct 15, 2026 at 4:26=E2=80=AFPM Ryan Roberts <ryan.roberts@arm.co=
m> wrote:

> What the patch series needs to do is tell us how this topology is discove=
red.
> I.e. will it be discoverable from the hardware itself, or will this topol=
ogy be
> described in device tree or ACPI for example?

Hm what about I read the whole series before replying to individual pathes.
It's righ there in patch 4/15, mea culpa.

Yours,
Linus Walleij
