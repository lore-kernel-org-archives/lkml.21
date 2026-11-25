Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795634400;
	b=SnzRcoFU8+OIe+Ldn/WeEzkP/GbDx+6EM+XBTqtV/OxS6VcKVCxwUAoM+00WCik4UQwP
	 Zl3ik8KyTb+iFL2DLJxYE0BYzZRI9TSt4ktU2rXJNZbgal4kh/RlpHsA92OSrg8pLtmrc
	 ONbCMQcOsR2EoWSYv+i4KHgyc5yy4QWcWDL9+4316lES4IbmP/gBIGpj2Wgh6EKmhZIpG
	 0RFVjHEG3bzS7pVRjB8ub0VZcufK/DUa5OOlOy7YmL6Z0TfpN7PDh4cf4Hymbyd4YU3zV
	 b848NitkLSOySFr/ssFNeAIjXrTH0oZxkdQqjC4/aHiFIevn5t4Dy/mu+sjuwX8VVIw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795634400;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=HMjVqMwWfVJkS2IkBXjF53S0Inck/QTosxfr8CwPkgc=;
	b=mW/HOz146n9XLVt0g0oR34TP5vDEt9/mTnVQiV+cAH69jDsk+SCLGKp9TOc/RvXi2HEJ
	 kWqKSun3hZD0vA8u4zMmoSlXuXOHOTYfaBFoUkCwo9Zfm6bdfEcgo9zl4X66ixLy0oLPi
	 PEyQRjnsjQhCi/l4tAjRD77TxT1mrjXctI3Ik1dxUDykmqRqNkVbPBrhjKGVEMq2BSlw4
	 GN/lAITMGgC9sxga4Dc/mI7UDWoj0C5S840hUueLE32B6HckoAQrricJcoQPunBHlZ2xD
	 QFiSiecOx0nBSDKthjWohH1xpRDq3l/f0mV41qTTMn/DZ8XvHiVbkysYn2PK+kQ+wEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aJkhhsCI;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69BDB606A32C
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 19:20:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aJkhhsCI
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C17EF1F000F2
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 19:19:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795634399;
	bh=HMjVqMwWfVJkS2IkBXjF53S0Inck/QTosxfr8CwPkgc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=aJkhhsCI5HZDNvJlXfWnRa3te9uon8LF9NfNHjioE4kF8M36Pty8PaVrkcjD1q7d3
	 EIznrbkNLsi6mx3J8hZwZB+l5TTZuVGYtWmLjbtcXrD3cXWul9I/ol/uSLq8nTBV9C
	 PUyyPtnkv4rBGgfvQzKnIdRrCZtF5rr17vOK5z8K+bXrBuVoD/sGTIT3BPb8dAEQh/
	 Ahck82IsLjD3liwVAUtmXY3Gr3qYCgK7ZCgV1LQ5qGmJ5k/9xitAuxbrdnQGM190qn
	 HL7abik+r/KilX594sQh1F+rb1mzyrNLws/7cgYA/eUMXymP6FIU5LQD8tVnvV/GdI
	 1rw/0b6CLIsAQ==
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-1aefd1bf74aso3158358c88.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 11:19:59 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErEpcBWHBt5O6z6lZa4ho+dSR02gjGV6YqZ7VRTQmnfhFsaRDllPL1iso7vVyrb4KjEuyljNSO28Ax4wFNQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z8ptVGF/7fdNHvJ/PLaRGyMHKYzLqMKbxZ0SM6WeEtVpR93jD3y
	RaU0eLXGm+KGHs+1HmOgNEmKq0x83UQVfRaoPTam0eu8CJM/LnG6BfOO1uSB0J6ZvX/lq8EXDMy
	hsSn0Vgw7cHMncGdnlH+/JNUQIR58UDM=
X-Received: by 2002:a05:701a:cc93:10b0:182:d0a8:d1a9 with SMTP id
 a92af1059eb24-1b551f69c66mr18716976c88.0.1795634399235; Wed, 25 Nov 2026
 11:19:59 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261029-b4-ipe-keyring-rfc-v2-0-77727b205844@nvidia.com>
 <20261029-b4-ipe-keyring-rfc-v2-1-77727b205844@nvidia.com>
 <CAKtyLkHtZeToq7YN7n2jffK0DmR7Axu3cQ+Kac_+RYvtsF=+cw@mail.gmail.com> <SJ1PR12MB6124F08E6BA4F0D1D7BBD9EBDE772@SJ1PR12MB6124.namprd12.prod.outlook.com>
In-Reply-To: <SJ1PR12MB6124F08E6BA4F0D1D7BBD9EBDE772@SJ1PR12MB6124.namprd12.prod.outlook.com>
From: Fan Wu <wufan@kernel.org>
Date: Wed, 25 Nov 2026 11:19:47 -0800
X-Gmail-Original-Message-ID: <CAKtyLkHfQ4QETWjxew37T4p=2vLyiAUW6YBm6PFjfrk42WimHQ@mail.gmail.com>
X-Gm-Features: Aa3M54rE3TgF5e5nAv8xwCNR1hIbU2Bku9v2QUAWAUX1eU3A3wmiOQ1vCGvM17I
Message-ID: <CAKtyLkHfQ4QETWjxew37T4p=2vLyiAUW6YBm6PFjfrk42WimHQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] ipe: add the .ipe policy keyring
To: Manuel Huber <manuelh@nvidia.com>
Cc: Fan Wu <wufan@kernel.org>, David Howells <dhowells@redhat.com>, 
	Jarkko Sakkinen <jarkko@kernel.org>, Christian Brauner <brauner@kernel.org>, 
	Andrew Halaney <andrew@amutable.com>, Paul Moore <paul@paul-moore.com>, 
	James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Luca Boccassi <luca.boccassi@gmail.com>, 
	James Bottomley <James.Bottomley@hansenpartnership.com>, 
	"linux-security-module@vger.kernel.org" <linux-security-module@vger.kernel.org>, 
	"keyrings@vger.kernel.org" <keyrings@vger.kernel.org>, 
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"kexec@lists.infradead.org" <kexec@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 4, 2026 at 4:10=E2=80=AFPM Manuel Huber <manuelh@nvidia.com> wr=
ote:
>
> My main angle is confidential Kata containers [1], a usage scenario in wh=
ich (Kubernetes) workload containers run in trusted, confidential VMs on un=
trusted hosts. This scenario involves hardware TEEs, attestation, and fine-=
grained policing of host-side inputs. Without getting into too many details=
, having an untrusted host bake trust anchors into the guest on the fly wou=
ld undermine the threat model. The proposed IPE keyring gives the trusted g=
uest the ability to construct and sign the IPE policy independently. Also n=
ote, outside of the confidential scenario for Kata containers, various Kata=
 containers flavors are very opinionated on the guest boot flow, so I canno=
t rely on UEFI being present. Having a self-contained mechanism independent=
 of firmware certificate provisioning would therefore be highly preferrable=
.
>
> [1] https://confidentialcontainers.org/docs/architecture/

A vague reference to confidential containers "without getting into too
many details" doesn't really help here. Before we can consider merging
a new keyring into IPE, we need to understand the concrete threat
model and why the existing IPE keyrings cannot work for that setup.

Neither confidential containers nor an untrusted host is mentioned
anywhere in the v2 patches. The v2 commit message explicitly states
that using the builtin, secondary, or platform keyrings is technically
possible, and only argues against shipping a static private key in the
guest build artifacts.

On the two points in your reply:

1. In an untrusted-host VM, virtual devices and host-to-guest channels
are still provided by the host. How does the guest verify that
host-supplied inputs (such as the dm-verity root hashes of dynamically
attached disks) haven't been tampered with or forged by the host?
2. For the non-confidential Kata case, what are the concerns with
using UEFI? Without UEFI, what boot verification method do those VMs
use, or are they not protected during boot?

Fan
