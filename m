Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795628025;
	b=h92Cl3OCccJG8Nvu26NWOW+IjSJgGmTlXJhDrz44GELTd5G352RKb/b6aOWKOGIFqfvD
	 Hyv3wVG65flsVpXxxK9cYbmkmSk2iLjMC9dpJ5GdaqLRqujhfBa4gaPf6dysJ4QFt25ED
	 aaK04XdN1Gsml4R3b0ji07CpwiawNqMwyzJQuclHtiw4WchEcxIVfbZtk+Q4tNsuVAEgy
	 Wv4X1MVBIUx9EvSMaUs8tb4ikOj55jYNrc76hMFYSAHFcoyDHBOsnel1Ys864yKys/09/
	 VJNGpsyRKdhdSxzTMAEHxpGrpkLLDoAvl3Dl9vyhUlpFalDBk2PgcyqndALySrWDvjA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795628025;
	h=Received:DKIM-Signature:Received:Received:X-ME-Sender:X-ME-Received:
	 X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=n/6bLDuC2MWLlkiw9AxsEw6O8WtH5WMIcohSXIYDu0M=;
	b=DU91o7N3N6bG1d2TM3kpyfAlcHz51ODDthP2mAnXx/fcvhbGbpfxD7qvT+BomTK+jcNg
	 Oz4axKRMa6+dIN/oynKgM02Cfx0/lFtjqHUf9ILWXqYPkx64JGg/kNMhxMi6m65USen0B
	 m5Fynb4FQAOe4wyixtcfP82fzhyHzD0XueTIOLMquXtcrU/4w71dNekpHF8g3vBAK6M/D
	 Je/C14RCeaN5IGj3pf3519wiXP/mT6gK9m7qYk7zXNJMTLUUU/+kvTLrJ25VdOiyChFf6
	 YRMzSOg7ti5Sz1YxPv46jEHNhZBF2/NPX2wD+BPWTq7XdyBkfCROVTOhtxoU2vN70xg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="a/qxYY7J";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9661D606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 17:33:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=a/qxYY7J
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31E771F000D1;
	Wed, 25 Nov 2026 17:33:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795628025;
	bh=n/6bLDuC2MWLlkiw9AxsEw6O8WtH5WMIcohSXIYDu0M=;
	h=From:To:Cc:Subject:Date;
	b=a/qxYY7Jx4KrcgPN7wnFjijIWU7q3OzxEz/YnyGrjKK+wKdSKLXB0JiYZCmn1FEbx
	 KuFrM1k5cvs7x3jXRL5AoInar9bPon5j//iN1LK0CHxMplHitTrTVFUgLBGMK/ZXXu
	 2r+rA/FZqP6CuoT1QEQI1aTeJ3iwP1dLEEgh8xnyWngBWVufuVa43dIFIx8Sr27WF8
	 ULNP2gobeKLxNGEBml9IVoljcPiLkkXe2zBo+X4ngU4qMW2QnZCuZJdqVfAahkfuD/
	 fdsO17cywQi1ZT+UKbdjDVGBUrF/N+L3Gvf8J4VwHcT0KqvTzek2rw/GgQnjdVWPeV
	 Czphq7SKI763g==
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfauth.ams.internal (Postfix) with ESMTP id 1463B198006A;
	Wed, 25 Nov 2026 12:33:40 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Wed, 25 Nov 2026 12:33:42 -0500
X-ME-Sender: <xms:9BsHa8rRwZ-B6dJQd39mb36_IfObKj3ULBUz0osEA8SPOXbM5snwEA>
    <xme:9BsHa0BmVBwiapEMhuUKQ7fl9cA7S8lwQll8ZeGsqSmQ6a01r4dg_ALumhlGRoFWH
    HTqZGW-BqY4arqLQMhitQAu3ZbFIXc_80kcEezB3sXoMRmC81PlFoo0>
X-ME-Received: <xmr:9BsHa6fIg0J2dn0Sfc3E8WBKM7hPXB_i7PX_qRaXMWPCeXRrLqzinpf9oVs>
X-ME-Proxy-Cause: dmFkZTEjneGXuSsh9t8RLA5fj7OcIMpddJIPpUqkcCDk1koCABNj0DB7+xf1dKOxMj9juV
    tF/xhAcgiETRmldAJL4fSnEhurJbuWquoguflFdf5cgOeCJcEe9MP0oUfMBzJ0/hMO7Ail
    h22HXZLf6H0rTSIZ9mjjY3jC09UdkvYKAJS20FoyaRQda/TTQNzNLog6Np+64GF8l9mToz
    q0cauJaKUUBMxe+bwgi1iKWVZ5OkzDj2yLkDwcN6+LwolQ/4feGVmf6XcJ1jZppe/5nEV4
    lJV66d31/jxmkXNOvdRk1UdK2Rzx/cQhOxp+eVwBZfETf9hpDaFDrDiGYe8iHaydo0eaVm
    J+QAX2klsry1H6D4sR5zJV1+nrOT4PUKbqM4OevwQYzQzb7m4PvTN+k63p9NVReNy7kgkL
    QdpCSmburxqhy/hzlKchbRPw7FHgm6h4p9+GX6Vm8Df7P6sKBPOmABxD827xs4jREwniYo
    eT25z3JA8qNMNakVrKso781cLFrnlBRXUCCAqw8gfDhgJE7laynH0C5jmMPacW98WjiLpy
    B8VO6dq/RAj38Whgsiz2yIe0xXSJzHs9N00zF9mdOLURLsgOVAIUlYrmXe5UScBDhMKRwn
    cOi1nnvBHPcVkqDkHS0dHHnu9e9zHg1WZNeZp3iCVFa/8dRzhh5Oc2qMSEJw
X-ME-Proxy: <xmx:9BsHa8IvTYgfK2V5VArj27Edso_U465UskkroKOd_XMs_XdOG6aFbQ>
    <xmx:9BsHayurQ7qvPx5WRFasGvucq6ucyUOxWsNwt_FtHXxK2Y4QVtgi3A>
    <xmx:9BsHa-bgH0VPYcK40-exctqVMUixUrrg_xb2TcZNMiUVwpfFZHp3tQ>
    <xmx:9BsHay24mIwRuAQ6r_oPPnN5Ye6e8gDSzrAFl6tWzB6XLoxyK9YiQw>
    <xmx:9BsHa0URsQasB42Xh2rpLAL_lRXL-cIGxOk9Pna-5bqINz-sv8Bh5i8e>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 25 Nov 2026 12:33:40 -0500 (EST)
From: "Kiryl Shutsemau (Meta)" <kas@kernel.org>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: "Kiryl Shutsemau (Meta)" <kas@kernel.org>,
	Ilias Apalodimas <ilias.apalodimas@linaro.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Mike Rapoport <rppt@kernel.org>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	Rick Edgecombe <rick.p.edgecombe@intel.com>,
	Pankaj Gupta <pankaj.gupta@amd.com>,
	linux-efi@vger.kernel.org,
	linux-coco@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	kernel-team@meta.com,
	stable@vger.kernel.org
Subject: [PATCH] x86/efi: Handle EFI_UNACCEPTED_MEMORY in do_add_efi_memmap()
Date: Wed, 25 Nov 2026 17:33:36 +0000
Message-ID: <20261125173338.1250080-1-kas@kernel.org>
X-Mailer: git-send-email 2.54.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The EFI stub reports unaccepted memory to the kernel as E820 RAM.
do_add_efi_memmap() has no case for EFI_UNACCEPTED_MEMORY and adds the
same range again as E820_TYPE_RESERVED. e820__update_table() resolves
the overlap in favour of the reserved type, so the kernel never uses
the range.

do_add_efi_memmap() runs when soft reservation is enabled and the
firmware marks any conventional memory EFI_MEMORY_SP; that takes no
command-line option. It also runs with the add_efi_memmap boot
parameter. A TDX or SEV-SNP guest booted either way loses the memory the
firmware left unaccepted, and it does not show up in MemTotal.

Add unaccepted memory as RAM, as the stub does. Without
CONFIG_UNACCEPTED_MEMORY the kernel cannot accept it, so keep it
reserved there.

Fixes: 745e3ed85f71 ("efi/libstub: Implement support for unaccepted memory")
Reported-by: Mike Rapoport <rppt@kernel.org>
Cc: stable@vger.kernel.org
Signed-off-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
---
Build-tested only, with and without CONFIG_UNACCEPTED_MEMORY.

 arch/x86/platform/efi/efi.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/x86/platform/efi/efi.c b/arch/x86/platform/efi/efi.c
index 5eb96c17883e..f03d5e984f2f 100644
--- a/arch/x86/platform/efi/efi.c
+++ b/arch/x86/platform/efi/efi.c
@@ -150,6 +150,12 @@ static void __init do_add_efi_memmap(void)
 		case EFI_PERSISTENT_MEMORY:
 			e820_type = E820_TYPE_PMEM;
 			break;
+		case EFI_UNACCEPTED_MEMORY:
+			if (IS_ENABLED(CONFIG_UNACCEPTED_MEMORY))
+				e820_type = E820_TYPE_RAM;
+			else
+				e820_type = E820_TYPE_RESERVED;
+			break;
 		default:
 			/*
 			 * EFI_RESERVED_TYPE EFI_RUNTIME_SERVICES_CODE

base-commit: aebb7274476403040d582c61478df8f4a7bf9cd3
-- 
2.54.0

