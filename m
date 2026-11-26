Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795669760;
	b=4Z4ohDyG6YZ0yp6Svak+cTR21aNIs3p9IK6dN8NdcF70MQROZgR0UBhgxM8peciQQ4+e
	 om3bYPH3WQF3CSoUlCXYpSFccvYEDyJGgqvguH8FhTXegP4cXqwMNdpnd5vNWX9NnoqF8
	 63KuNrEAbQVtijaaWkeqCUoZW41zeufUmEtSeVZ9c0K5fJeCC1sFBMab4NQzNDl+DhetW
	 gxv8GjuAfgjneV43hsfe9L3RLNns9O7NWAGx4mniAawGFyFepXvq6me4i6jtgCT8Qf7Bb
	 xDxKXIv6OzauVQnNwCE+Q9dnESuJH3tnlq4gYTHWx9bmAp1ntuhzrW+0iqVRppoGzQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795669760;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=S1HSSshjmPkqz79dXnEgGWEjXTt5qVtgnEZaDetyRsA=;
	b=z2KGnxRY7jYlRVF0/uy8zFMCppc2buglWvO7n8s48+kQEgGffcFvMf099nC/L8Nn0Z/c
	 mq55mJX0PfIbhNJQVaga7/7CygaeC4eGWxd5f4QBh23N8lh6u5PjGtU5l15HvrCGRxCoW
	 JNoDdTSjDjWxSoU8f0SUvaxE0eHLyL2TyGxZZVJaUd43q1U/DzXrroKZ48oi5sEqcARz3
	 BfH7uB8G/miEIvtVqIjLUR3PyYLY4dmlbNUQvAf5e1xksbjT1nBwfvhVsMzcMhJwdQ29n
	 4VsMa8XOdfELGDEDnHSgS+o62NEtnHJ2Fxwp9Rohwd/+hgnJ0+RUx61EB3d+aBnEUqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Bb+z+LpN;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 604C6606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 05:09:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Bb+z+LpN
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BC8A1F000D8
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 05:09:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795669760;
	bh=S1HSSshjmPkqz79dXnEgGWEjXTt5qVtgnEZaDetyRsA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Bb+z+LpN1m27T8MR72joD+HGa4Q+jBUOTHmH8z0FiHZ2plcdtAvq4oDaYD48fyriM
	 W0XttaR9sDljd8yEXHQZzL8apNhfitdq0KBIwa8pjDHxRDKAZ3RKKvdFJwCyGHaXl+
	 q+6YgtTP97rG+8sNHZC+LxJmvOoRIO17kTl6jCntTS4ONfAAYkWmbMrXQO/Mn7HUVu
	 YbHCW8mtPleTNktXBiM+sNmyiPEOM863HMrO3QMZQFNgP/Yo/XyXorFk5oqd3I4cIJ
	 tCmB07tTJV/SSfVA5MxWD1QrrwGyGp4fZmu9HFTpeH3jAhd7MAOz6gD8O3dkQtKNcs
	 UX+eL2XJzd7zg==
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c5126505cb3so849332466b.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 21:09:20 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErEwvxnIxx1r4GWUmC9joK1VOJSbd4aZEGJQuU3kRMV3dyykEV1lU6UXYQKlqay1FCJwzgps64eNCdy5hp0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8w0dbk1A2rmx+YaO4HKi13D98KMwWu5T9jp+/HhpWeaziXrdu+
	wcVmKn5PAxQ6hz98jK7nI+5Jpc01vA4mCQsPOvHV9ihY2VFbH2ujrTy0gCwlOXzel6REb8UdF5S
	78cOIBydJKyNEsf0nuZI5OWdf5wpQeAo=
X-Received: by 2002:a17:907:96a0:b0:c51:3cf8:7d07 with SMTP id
 a640c23a62f3a-c513cf87f18mr1544835066b.29.1795669758768; Wed, 25 Nov 2026
 21:09:18 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <179558384099.146091.12975349907127521352@163.com> <20261125085004.1816027-1-shawnq1@163.com>
In-Reply-To: <20261125085004.1816027-1-shawnq1@163.com>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Thu, 26 Nov 2026 14:09:06 +0900
X-Gmail-Original-Message-ID: <CAKYAXd_6+H28_KNgw3c1P3GL+OnsGuKhSidLQkcrsqFA17cxxA@mail.gmail.com>
X-Gm-Features: Aa3M54q9iicmQhqC8G7jUu05Bg8W7c8Nzhmo24E5ctERleic9K339gXMJgXzZTw
Message-ID: <CAKYAXd_6+H28_KNgw3c1P3GL+OnsGuKhSidLQkcrsqFA17cxxA@mail.gmail.com>
Subject: Re: [PATCH v2] ntfs: guard the final LZNT1 sub-block header read
To: shaos <shawnq1@163.com>
Cc: hyc.lee@gmail.com, ntfs@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 25, 2026 at 5:50=E2=80=AFPM shaos <shawnq1@163.com> wrote:
>
> The legacy NTFS LZNT1 decompressor reads a 16-bit sub-block header
> before checking that the full header remains in the compression
> buffer. If only one byte remains, the read crosses the end of the
> 64 KiB buffer.
>
> Return -EOVERFLOW for an incomplete header while preserving successful
> termination when the buffer is exactly exhausted. Validate phrase-token
> length against the sub-block boundary before reading it.
>
> Tested on x86-64 with QEMU. The original header-boundary reproducer
> and a phrase-token boundary reproducer no longer fault; both malformed
> streams are rejected with -EOVERFLOW. The one-byte control still
> returns byte 'A'.
>
> Fixes: 1e9ea7e04472 ("Revert "fs: Remove NTFS classic"")
> Signed-off-by: shaos <shawnq1@163.com>
Please tell me your real name so I can use it in the Signed-off-by line.
Thanks.
