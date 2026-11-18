Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794975282;
	b=1UUXmT64IxTcMwmVh8LH7faGqe8hELpf99i7ltjKIzr1w+7uibB8+kjGA+OmQsM5TA3P
	 clVOLwt+tc4M4WUcOE1ZZ2fxIek7Sds2alQK/r9+2AzO9WTQ2OwCGTgIfs3M0g4SjI2/9
	 3MC2j9qlyWjS6yzFqQCZ2uZY85RtEhIRwLxO8NLCaT6QlETVOsicTw77QLS3ac9fJYU/l
	 sMU1P8MWNBVnDDtNMM2PF684LgxBSV0mgn+/pk4JHgJ4f2IeuTAOBUZNAFCVOMqDOoyRN
	 pDn1aC1ldtkFF2LoskkJPBUc2goX+jyHfLLz4fVpdxjd4ZkJoZPVOl2cG7Mv9313jzQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794975282;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=78OEmd4BnQnAIL+/edXoWjTbrJ8v+9Ag3/ei+zWF0bs=;
	b=40/mHu8FYMQjSCcx9r/YWZ0qSq5DlrNiToV/j6R1PHao+O+ZLpLu1BwopOF9q9PJtCcv
	 IxhlngLJq1Oro6OudOXbCdKl4U5C3qcY7c0gvcLDutfZHBcCCN3xkcGWVnWs+J3PlUxBf
	 6n1JsUlkPQnwnk5tMpt2PG0CbGtot5ovXqkItKGCd+rmvBxd4NeWRmD+g3erySHjc+UR9
	 uQcsNsfRcSMFoDUekINA06Cv5y0phaXfiGBLz4zwyFhraw7bGj7wq8uLVSE1Hz34eApdk
	 9jWmt2FahnspNpWp+Q3DxvB589FLUPKyM6r/nMyh1SUMNCDt/L27/ieikccMKm90L6Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ZwrGQdVO;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.46
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2B1F606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 04:14:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D2B1F606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ZwrGQdVO
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6b869ea8224so8153a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 20:14:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794975280; cv=none;
        d=google.com; s=arc-20260327;
        b=GpUA+G+ivehg7sB6MVqOY4STBE1yF+ErdrRxEKD+68XMs0jRMC3BWmbtItHg4s0Bnk
         8G3e7bll9FMmc8Xk2rRv15elKid94iV8+8Lj/KPUqHXMxplyNklYiAPFDs6WW8ssXTyW
         7s1bpHYL86N6DfKvi/Da26WMd/u35yfpuZBun673htwmauRMIaSrXEBxczbgykvQP8Lm
         3q2Ue8GCJZKnd0g/SRdq8UDOFXilSFKK+3jMvXeSdmGnEcx4GmgEGoiH9TyH8j+BnbFF
         zAerTxVHcKjJ343hRBh64KvjEUEk1hDLpk4gut4zwDI9nt7Mrd52ESZpXpRLvXY4GKzW
         sLtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=78OEmd4BnQnAIL+/edXoWjTbrJ8v+9Ag3/ei+zWF0bs=;
        fh=qgqYWzBn9P1miDiCzkbiuNWxKUqGk7NJZnQP7RyxBOc=;
        b=Gk+ryO3bl/4bVcWWCWG20SkcQHS3nuTnD8jgsVYRW6Ydw/3KDXAQY78gypwCC4tb3c
         5spIpivSelwZ2PoJT3PCIfSFcxZymtwySmMw25SDfjCClGpPqPWsPz8LaEgH1zR3+pvl
         X9CxjiB6F0Y8+CO9Rcnyr0IzEwuFSwo4ACD+E7WLU4LmcYpu2XCOpJ1ulOmtxU5slJam
         Iq4BinsYxsOxF9j6g/kJssZ63FyBLdYKCc3THaz+Mne4+jqiyenu4HPkGR5gVZHfHAPm
         HFDLeXd+iGJjge5cr2jjhsLJH//tnoPp4bZQr3wTLcdvlZ2ABWWJ8Q2JhqyLMSjeRlzV
         2/iA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794975280; x=1795580080; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=78OEmd4BnQnAIL+/edXoWjTbrJ8v+9Ag3/ei+zWF0bs=;
        b=ZwrGQdVOZx99x9RiTFvQPYbMjUPCrWIWA5Vpv9CZuZFyezfx2BLCYZgI+4cIN1MuiX
         5fNq2X2flwYccLr6+ItVVqcxy1XskrnHVvEXCxRqjjy39SG4kZV9pnYyY14TBUpTSe5j
         lvG/+7+SKDT5RD4A1h4l+Ty9QKiofbp6hfPxVWNfDtRj4/IiwJoomhyfnAEODpB8uCS0
         3KWQFeXbJ1S4uRBiCSYnxgyhNHA88L7CxTj/puziZjKIGAXkMqLqO3Tj9uqi34UcsnYl
         ZczhDx8NyrdPzopRHr/mntTZ0kiJaZzNXAj5bvh5vucvXoHOCR+4z36pH8i1II5/KQVb
         Z8ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794975280; x=1795580080;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=78OEmd4BnQnAIL+/edXoWjTbrJ8v+9Ag3/ei+zWF0bs=;
        b=KXN49SR0uEv8uXJqks23eIip2hdbzotRIYyVUnTFLKU+e6HIsStZudMOWV9D+Zwtd6
         u7oY3dJnP0L2e8yRCp74uKFWGBRTMTuN3qjiriV6PYpHzrK7mctLkKGr3Sut+64+gWFn
         teTmJW4RHIixOQOEFJYq6tI95NLQrWAXTaM5TQfz4Ws4rXzsK8sjo6C5tOkCAdSnvvuI
         MopuQr08HRI7bTIgCDsrJLMW3yqTj0Ma7p48kRQxllzAR77BtQ0AQ+10H2DRECV8jCaf
         fisRs6a3WkxJQnN7wplTRJXxa7vbwLFzCLFo8ANDk7fCuEuA4X8ncgL7QQm4UYazH9ld
         UY9g==
X-Forwarded-Encrypted: i=1; AL+hErHWf96n8gE/LaUkuw48NktbZX94V24h2jZ8qpe/u4byZ4IfQ/WHXrHzAw+Y60CxRMJBp4G0RYffgVgmlPI=@vger.kernel.org
X-Gm-Message-State: APuU4Z9JT7z6IhMXejv2YQvNCTRDzJtbC+dzq4P9dy25KQTn+z7Rh//7
	xSH/ozInx8QsQ5haFpUTiqq6LnhQm5AJ6FQ6iI3E33wygRKqVd56GMG4s2uV3KgRAHT1aZeQnwA
	SHhHB3FZBYGq7q1vEtZFuEyhg+2Mkgj2PqYOx3Ii+
X-Gm-Gg: AYBFou3ZgZ6lQLjhALmMqqRi6vY4Ic7hIuiSDjT9fcmYLncyZJeqrmUuA6nMCTdXP9j
	If8Wm28BU3o+RUZeTc2wkKB2vKRbTdWHLFB2c7eXl6mekp1ovLo1USDw7vmaI7BSMTuB7czC54A
	hb/9+xhwPl9WkWQg9Sz7heE2D1RwGnKWfonKKz52igqp1LVdSLPp6poxfrT9itn5Agpj/BesLNT
	3ecttms80mL9yXWMHCqi5Edblroe3yU62RMNtFGlTQ1QRT/LCU8Z+Pv3xM+i2x/MgrvYGEAP2WU
	RbVlkDJvhRg8o3mU8X7/aT0SaWHIdH+8/kOORuVEjf6OmuuGsHfeW2ci/9mOWPMTJKsWzwQPYiI
	nUQ62aCOdhL5PCjySMwQutlSVgAyP0ss82m4puw7wahd6Jg2UBr7lqLB9HUTvPpszdte5wUfJyV
	WgBVOXhbYugP2O9LEqcFF1hURfcUlYOmBw3W2izDChstT8cah4kHjY/w==
X-Received: by 2002:aa7:d687:0:b0:6af:afce:184f with SMTP id
 4fb4d7f45d1cf-6b88848206emr52162a12.3.1794975279739; Tue, 17 Nov 2026
 20:14:39 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261117180310.921701-1-chang.seok.bae@intel.com> <20261117180310.921701-11-chang.seok.bae@intel.com>
In-Reply-To: <20261117180310.921701-11-chang.seok.bae@intel.com>
From: Jim Mattson <jmattson@google.com>
Date: Tue, 17 Nov 2026 20:14:27 -0800
X-Gm-Features: AclHuK_6K2MkOrWw3JfAYerdh8WpXc2mA1P1Hxo8frcP4N9bk608N201LA8GG4I
Message-ID: <CALMp9eSw=ZBxMaHRc1iAXZaRi5Do+eDrd2O_YBWGFK5==3X1Eg@mail.gmail.com>
Subject: Re: [PATCH v9 10/20] KVM: nVMX: Propagate extended instruction information
To: "Chang S. Bae" <chang.seok.bae@intel.com>
Cc: seanjc@google.com, pbonzini@redhat.com, kvm@vger.kernel.org, 
	x86@kernel.org, linux-kernel@vger.kernel.org, zhao1.liu@intel.com, 
	Chao Gao <chao.gao@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 17, 2026 at 10:32=E2=80=AFAM Chang S. Bae <chang.seok.bae@intel=
.com> wrote:
>
> Define the new extended_instruction_info field in struct vmcs12 and
> propagate it to nested VMX. Gate the propagation on the guest APX
> enumeration, which aligns with bare metal behavior. Thus, define the
> CPUID bit here too.
>
> Suggested-by: Chao Gao <chao.gao@intel.com>
> Tested-by: Zhao Liu <zhao1.liu@intel.com>
> Signed-off-by: Chang S. Bae <chang.seok.bae@intel.com>
> Link: https://lore.kernel.org/aRvOSnaUt1E+%2FpkC@intel.com
Reviewed-by: Jim Mattson <jmattson@google.com>
