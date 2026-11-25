Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795635842;
	b=NNNuh6hGfywj4+qAukaJ91C+zcfy5DQWNpaeeycYkkJjaYn3Hm8t9GDRJkLMs9ZniN4G
	 uvqcVJhV7i/Gyovp4fO7z4KoLiWdFrC2LOyha4hQg4Ksd0V2SZnMSK8wjbsxm6D7dgSUX
	 sEkaRKx5TF2O6pez24s3KXZTQzapCLI0aRqyjkcXy/mQSuBDdSsAzDdR6EeS5AN8OOvxt
	 GTh2M9XnZMQjq/CgGk63fx8+9vN3EI+edT9qiHU4cjP7wJwBq/+EMHN5TJ8o799pPx+0y
	 lezqCYwGV3Z5jtg3kxDvw5sPyGKs8shkHWezynilsFssQzoAC3VDMY+4eJEqny7mnpA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795635842;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=vRPmU+/hfY//G5IeGfjJPt/W101rY542B/faEGkldBk=;
	b=X3NZJAEfB0vGV3nbvuCOcl+cswXlW8qTAnOCHJA4xgvE0sG4g7v5M0IAqMIMaQcF/m+s
	 DVQYt95uoxY/fWwWoD60E3Wczxer08Xq9Pdf82uLXij7FDdn1P7R3CrG9MGaQJ0oIe1vf
	 LZeo0jCtEoDa+9RDFoHLQ6wPSvP3zr6ZEp61J8FqcDYlgC6eRDJb2gJwfKjyPxpBCJ59p
	 zkAyv2wtTxeFhdNmCVwYFtHmhBFWRrXA0eU27yZxQlvexRF+yNhH9QO4KCDa7ddUlYVsq
	 SgWJFeRhpeyvR9ILwANNNo0C8c0p7+OXI0/B4lnvmUzVdiOWicKtDPkb8kPa7cJaqUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XG0UVB9C;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F5FC606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 19:44:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XG0UVB9C
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 522DD1F000C0
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 19:44:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795635842;
	bh=vRPmU+/hfY//G5IeGfjJPt/W101rY542B/faEGkldBk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=XG0UVB9C3q74ZOqMzsPtnfYbZeusKzlFSNTjyukGWuKYwFHmJM6Zr4nJedo9bvqNn
	 9f2/0uEVQVNq+2M7Vck5NZmyxcQS1Jj3NfOpr/cxTvZBue+ZvJGXF54VL9x9TdrB55
	 8v+AM0enAkb6XmZUKN0C4qrmxgaE55a+wONSBsnc1QGiZsgGcVhCM74Cag0rmyJxLn
	 Sr0TCvqG4mxy8c2O8os6smow05ERmmEs2BJGp97ccKXg4A6f7UiF7oMe6x8pWyZ2Yq
	 OODJlkur0+ojdxQEh4WKX+SA7DC8Wzvh2XptyK9PzICTiODt+0lFNX0WFNkegy9eV7
	 5n/2sKUeiv7Cg==
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c516a192844so599405866b.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 11:44:02 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErF1Lw2OSvwTqQBAAdCEuoj/e4BvtB6upe2V6Pr72WLHW972r13vDlRlydORsHAydvad7itls9C2HO/Ujjs=@vger.kernel.org
X-Gm-Message-State: APuU4Z+/OuejvgfZJKIYCJEHcX788kSvDwO4P0n0zmONFFQjUw4OyEln
	vl00GGSCVCTgCIiIulXhwaDqeiW6zcQWQ4Fhpi2Y+XApIZsb6/bOSYDeb1lTRYiYAp69eFaBOMx
	HPFMgoBosTCnSB+92YEAYjf73/wHI8xQ=
X-Received: by 2002:a17:907:da0c:b0:c50:5545:b66f with SMTP id
 a640c23a62f3a-c513a803353mr1445531166b.23.1795635841280; Wed, 25 Nov 2026
 11:44:01 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261118233719.2101265-1-jmattson@google.com>
In-Reply-To: <20261118233719.2101265-1-jmattson@google.com>
From: Yosry Ahmed <yosry@kernel.org>
Date: Wed, 25 Nov 2026 11:43:50 -0800
X-Gmail-Original-Message-ID: <CAO9r8zNV3w7bQuPw59Y7Os4Z-1K3Ba6QWwp2TvJdY-fNhBiWUg@mail.gmail.com>
X-Gm-Features: Aa3M54pBdwALV85djUZxebzdMfDvcMR5Hg4ZKY8Tzpg3YhE9I1Axp16L5ZNrY6U
Message-ID: <CAO9r8zNV3w7bQuPw59Y7Os4Z-1K3Ba6QWwp2TvJdY-fNhBiWUg@mail.gmail.com>
Subject: Re: [PATCH] KVM: SVM: Set V_IGN_TPR when enabling a dummy V_IRQ for
 an IRQ window
To: Jim Mattson <jmattson@google.com>
Cc: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 18, 2026 at 3:37=E2=80=AFPM Jim Mattson <jmattson@google.com> w=
rote:
>
> Per the APM, the processor takes a virtual INTR interrupt only if
> V_INTR_PRIO is *strictly* greater than V_TPR, unless V_IGN_TPR is set to
> bypass the priority comparison.
>
> In svm_set_vintr(), KVM injects a dummy V_IRQ with V_INTR_PRIO=3D0xf to
> trigger #VMEXIT(VINTR) as soon as an interrupt window opens, but it does
> not set V_IGN_TPR.  If V_TPR is 0xf when the window opens--e.g. when
> CR8=3D0xf (in L1, or in L2 with V_INTR_MASKING=3D0) while a TPR-independe=
nt
> ExtINT or userspace IRQ-window request is pending, or in L2 with
> V_INTR_MASKING=3D1, INTERCEPT_INTR=3D0, and vmcb12.int_ctl.V_TPR=3D0xf--t=
he
> priority comparison (0xf > 0xf) fails, and hardware masks the dummy
> V_IRQ indefinitely (also stranding any VM-wide AVIC IRQ-window inhibit).
>
> Set V_IRQ_INJECTION_BITS_MASK (which includes V_IRQ_MASK,
> V_INTR_PRIO_MASK, and V_IGN_TPR_MASK) in svm_set_vintr().  Note that
> svm_clear_vintr() already clears and restores V_IRQ_INJECTION_BITS_MASK.
>
> Fixes: 649d68643ebf ("KVM: SVM: sync TPR value to V_TPR field in the VMCB=
")
> Signed-off-by: Jim Mattson <jmattson@google.com>

Reviewed-by: Yosry Ahmed <yosry@kernel.org>
