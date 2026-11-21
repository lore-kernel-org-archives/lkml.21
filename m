Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795220993;
	b=MDmxHK6BPYmvuwGDAvk1VGVQQAa4Cgw7FJ+Pa+EYz9FS5/xoLjOAXB7+MVKBvqf0E+Rd
	 UrckQm0X38on+T2kiDns994PbXCfzA1lCxu6ayfit45RjysX9H8t/kzKKLWPHAN4GmMn8
	 emVpQAT6F6LedOtRK0IiXonT5osw0Z9J8FRs/nU8dEHgRQeH3KGcaIeDPdtWGi7C2R8zc
	 X8Jxt0SVb/9aYBo/Og4hz1ir361ntnmH31jJzmqYwEhChzIKJR693bSvAD+WXQaSVc7d9
	 f5dCPppyNAl534tKsHL0jr9ss9Cx/SBJEN+yNpCB0STsI78IgASAsp4EOSBmLG2ArUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795220993;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=rD7rpVjyDNmPoXFf48R53o3A1muaq1HYLrGi/n8jnLQ=;
	b=4UvWo4e0+PeFLL0E8qSQRFmlR+u+phR/gkW824fXr6OHRhQbEwcbmH3Mn0veb2pAJQ6g
	 4P5j9TJZHWWpE5HlMZBft+IktZ4FFijIL8zJgEXJE+ljlXdXSOx/z9BFYrq/Jnxy33kYW
	 rH++Lh6+eb7sE3xNaSMF2vwHh1zcU813z1VXeVus+7I+aSEivKRGM9SfNicDePGUFKXoE
	 kZnsOh25qrPXMRx+x1i6PTL6wJhGT+g4iXMiw9yh35HelajzE/4Nv4kgfmDETDbRBswli
	 BankG2U6+O/H1O1QWU1YkDpKrEGpYgfnDG+0fCyT7jyZSFeVKQ5mwuooOXIdswQfPQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VoS50GYo;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38A36606A6B4
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 00:29:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VoS50GYo
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A9221F000D8
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 00:29:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795220992;
	bh=rD7rpVjyDNmPoXFf48R53o3A1muaq1HYLrGi/n8jnLQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=VoS50GYoz23WScli6OCrp42uoHzt0bSQGlahzkogaCoa8UR883PfS997g1VhGOemb
	 omAUOjA4Nf0X0OqCDviwY/JzfotusUP6WjNa3lqJDY+ihoDasF00d8NCWPdJha2i5t
	 78L6SrETey3o6UscVz+u7vm1/3ytBWjt0WnQZtaiK2eb003Z0HvDjckheuSHierV7y
	 +gzlFMpmnV4V/h73CFpKv83szNdhG/xiLZcy8I1YGIQ0wDfqSmvSlaeb3sCaYvIQF3
	 ZDpI2nmBHRj8QQf7RSlSjQcq32YF0YxQzKYZHyR3ELsfWuixpCd0C8+4yBDDl/riap
	 soaBFAb7Y0UYg==
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6b596afb4c5so1690021a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 16:29:52 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHwxdmkd1s1dbCsTZHPl+1O7BjGb449BfJ2DiI1TizJdmqCh1MHTQrJ/klSlcP8MUiD/lTMBWQASG5MccY=@vger.kernel.org
X-Gm-Message-State: APuU4Z99Pc17qa9ZE2VpNTmCWXpdtVMEAMDYrcoR/ir3Kq8LaoEsYFkl
	76ce+ettWQw1mn9S65fvhni3LhyuJsFxnZIEuXJwwfN9FjuBAJ5Pe9emBIBoTOSLX556TVBhQ1T
	mLRiJOVwb9VbW8o1n4gyV64ouDUxmPwY=
X-Received: by 2002:aa7:cd65:0:b0:6b5:823f:3462 with SMTP id
 4fb4d7f45d1cf-6ba37e83f29mr2483897a12.19.1795220991152; Fri, 20 Nov 2026
 16:29:51 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261120163436.15296-1-icb@fastmail.org>
In-Reply-To: <20261120163436.15296-1-icb@fastmail.org>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Sat, 21 Nov 2026 09:29:38 +0900
X-Gmail-Original-Message-ID: <CAKYAXd--8hWBZByqGjt3d8E65uJSS8iyc_VgucMvXuE99MRNhQ@mail.gmail.com>
X-Gm-Features: Aa3M54qE1Zkgvchom1ErPwtXwjTD47R_3zEhhGyatIfGzxipZ6T7uhWeq9rzynY
Message-ID: <CAKYAXd--8hWBZByqGjt3d8E65uJSS8iyc_VgucMvXuE99MRNhQ@mail.gmail.com>
Subject: Re: [PATCH] ksmbd: check the ACEs after an NFS mode ACE in a DACL
To: Ian Bridges <icb@fastmail.org>
Cc: senozhatsky@chromium.org, tom@talpey.com, chenxiaosong@chenxiaosong.com, 
	linux-cifs@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 21, 2026 at 1:34=E2=80=AFAM Ian Bridges <icb@fastmail.org> wrot=
e:
>
> An allow ACE with SID S-1-5-88-3-<mode> supplies the POSIX mode
> directly, and parse_dacl() stops walking the ACEs at the first one.
> The same walk checks each ACE and maps its generic rights, so the ACEs
> after the NFS mode ACE are neither checked nor mapped. set_info_sec()
> still stores the entire DACL and the request succeeds, but part of
> that DACL can have no effect.
>
> Continue checking the remaining ACEs and mapping their generic rights,
> while preserving the mode from the first NFS mode ACE.
>
> Fixes: e2f34481b24d ("cifsd: add server-side procedures for SMB3")
> Cc: stable@vger.kernel.org
> Signed-off-by: Ian Bridges <icb@fastmail.org>
Applied it to #ksmbd-for-next.
Thanks!
