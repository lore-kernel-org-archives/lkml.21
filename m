Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794949843;
	b=k0UDkp/gSMrWfM5QKOdDQSYWcFijVkCU9ceOti5X01Piduo2RdcNFrMGWRI7re1DoAEo
	 Gpqen+HWzSR841+xF8h14llqDrOlAgoF7Izx2LfAuvxQHymnhHUvMQF/qcb+0GU40CkAQ
	 BcxEdvGJvUc+A1sfCXzP6aOKY6sCRPKtkhdhbvqETai1hN1wuCByjDpgFsh7q2iLRG0cR
	 vts6SXJwfUiXoaSfmUHaEQwGH6bxG4rA2msUcqaM2J0xAN8ZMknaiRqI+ShnPYPBtIBEU
	 QRDFDqBTs6jWhTp271MvIEJPAlJAERCEGDN6OXLxlp0TIvssJyOMYtgDBu56B6Pk/KQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794949843;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer:From:To:Cc:Subject:References:In-Reply-To;
	bh=RbJd2yor7a1B6FmjIbgcMguBuxsvlroWpg20DMSf/BQ=;
	b=MTSD2Mmny93sOa7D3BG93pYZj+s6juxz26KMZPrQy2XxceRKB7qgxCZLoUOa7Ui7pd1d
	 0l21eYUctNPoRcFi45lnt/qu4pgz3Bi5w8cqy5YpEvikhxlIUzZgH5h84yZz6aS3SV0mv
	 Rx7rnPoXm7jtXTw1GLwunM87V5hON9ApY4KwBTeR4jd5SFD87PNYNPzkJqSVUCrCVTcUb
	 Y1IR8ciYIwUSj6vGTKaGbcmBvtevoqantmAA//IhKYokr7x1JZmWT30N6tE/zMpzb6xwf
	 JCf80wcASLfUEfxKNpslZWV8BpZ2niigfqiOul1HwL0SSN0VeN+rddcdA3qwsTetxJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=paul-moore.com;
	spf=pass smtp.mailfrom=paul-moore.com;
	dkim=pass header.d=paul-moore.com header.i=@paul-moore.com header.a=rsa-sha256 header.s=google header.b=W3OC8bYO;
	arc=none smtp.remote-ip=209.85.160.177
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26AF0606A881
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 21:10:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 26AF0606A881
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=paul-moore.com header.i=@paul-moore.com header.a=rsa-sha256 header.s=google header.b=W3OC8bYO
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-55c48582654so2806651cf.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 13:10:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1794949842; x=1795554642; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:content-transfer-encoding
         :content-type:mime-version:message-id:date:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RbJd2yor7a1B6FmjIbgcMguBuxsvlroWpg20DMSf/BQ=;
        b=W3OC8bYO8X0GRGY/8MZ8eftx9H37MJN/mqo67JR2Cj9y5iuqQPFfrOX/jF0nkOR5AM
         mQxz8x3bP+lCKpB4imrNuaoy/47un1WNB30A0skerxA9mVRkJ/TgRdXrPyqwS8BUduf3
         7uF94Q9fEU7cVLLSlTfZCHLjd+bpY++5Y+RYjd+oRIRv9/FjuB6BLXgsd0n2Wsp95IXp
         ovCiEI8sntqLUQM2Nhvrd747GOyFmF4JAI02AZpVCXNuPeKs0WBYulWn/uoNPaXNBMel
         Xqyda38WxpnJOSV4AJJA4ov0bl+yDJGqF/jyann+XyvB7RvpYsPtOf0eY9w6hSN7W7qg
         vSQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794949842; x=1795554642;
        h=in-reply-to:references:subject:cc:to:from:content-transfer-encoding
         :content-type:mime-version:message-id:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RbJd2yor7a1B6FmjIbgcMguBuxsvlroWpg20DMSf/BQ=;
        b=SlXvN5inMdsy9joPDbedpNawHfJjUDP3VHPxQIYsLbuo0VNBjcvJAzK1pYYLtkPyWQ
         yIMs3+kIbRnO4DK8OTwxYHxtwgKV3cKjqmIVzkKEBwI2Ev+75rxAQxFgnsjBXP6cz+NI
         duKW/4OkLatg30LgnF71qx63NgIlY0Mgw5AzqCrZ3VfeKxj8IVTz/FObELRg5SdlrRU8
         XntfhAZrPxD/18OUiJi2BtR+4x2sEBmMQE8xaPpLHFt88QjqiSPxVUpkP0SlB86WwvIa
         1xsGtY4EYLIjw4nuooHosQAvP9mXTjhvX/tVHeQZY2XASoodkWJoEoBFu5/MxyACjh7O
         s38Q==
X-Forwarded-Encrypted: i=1; AL+hErFjak/7Ci+G2k4UK4F2D3MDkoeSb/A8qWdMWCiJWGrQx9tyet9lEM3YPqwK1ZGRFXQTG0uwvrI3Ho1kGzc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+2V38f6f89CkreDYs+N/dYUJXrKHQw0Xyp1HqQn6+dCQxFuxAS
	ichRhdbq7EFE5UY3aA+I+px0Ch1vzEpg0NRQ2vyqWlK82zyD2+OWnYG+Q2rQuvonpw==
X-Gm-Gg: AYBFou2Btm4VrxTwwY/zIJGhmDsFTGoLGlpiBmpt6+mZCVVzSTanOeWcZN96Wb3DtZ/
	NDCdCIhStnJgPSIOms+EePvJtWNI0wz+SVCQvu2UX/kVWBrNygju+4Aezt7zKVzX5st0n0wbzto
	EJ1UbiJznXzDmPSa16iZKXUI3sooDmq3gb0d5Ym0WbSjXycqTul5IJibPF8PLXoxltDuOCGK4bA
	jhs8LFv00aFswCQdIr8sarEtHjkYd50we7DyiculTqcGm5OuG2/nkDmIXHETTySuupJ/qFRA1TJ
	r8ZRF+7Dnvp/j/Cr2BO7BeyjY5CaIrRmKflFDLEKoBKbQ5/iKJNZPda+tOKTjyzG8Qk6PzaB+Bu
	IVQxgjl//4mFlO/S8rAoZhTug3J0NtZSXIMnWtXMHpht3EXFyvboUOadOid4Opm9cPyCsOHRs7e
	UDFniR3zjbTEpi31XBJiWXZkoLfg7HzhSMwdl8qUluRv3KLoAQKFoS8e5DB4Q79YlRNZESROKX9
	+WpsiqTitJ+0i5pzxY7nVSVoZ+9J1TWXVl0DlsMT3qBitAPeiEyM44V4lX8vkUlWO8qzF9j3LlT
	NSHspCzkEuo2s6sCcwvTJW/6wS4Zfu70nMH4+1xEZT8onbNOm+/vHRjUPylkTgdkjPuMK7OPmwF
	AZEpdJlKFhZadA9baqSIvQ58D5cAndY4hn9u0K8ZTY4sVnvr2tDCM
X-Received: by 2002:a05:622a:c8c:b0:535:162c:2e83 with SMTP id d75a77b69052e-55d5a5543f1mr9261781cf.16.1794949841754;
        Tue, 17 Nov 2026 13:10:41 -0800 (PST)
Received: from localhost (pool-71-126-255-178.bstnma.fios.verizon.net. [71.126.255.178])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d59f7160dsm4614811cf.29.2026.11.17.13.10.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 13:10:39 -0800 (PST)
Date: Tue, 17 Nov 2026 16:10:38 -0500
Message-ID: <6b97318740a2ed35f6becbae7c24395d@paul-moore.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0 
Content-Type: text/plain; charset=UTF-8 
Content-Transfer-Encoding: 8bit 
X-Mailer: pstg-pwork:20261117_1552/pstg-lib:20261117_1552/pstg-pwork:20261117_1552
From: Paul Moore <paul@paul-moore.com>
To: Thorsten Blum <blum@kernel.org>, Stephen Smalley <stephen.smalley.work@gmail.com>, =?UTF-8?q?Ondrej=20Mosn=C3=A1=C4=8Dek?= <omosnacek@gmail.com>
Cc: Thorsten Blum <blum@kernel.org>, selinux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] selinux: use isdigit() in selinux_genfs_get_sid()
References: <20261014160741.222219-3-blum@kernel.org>
In-Reply-To: <20261014160741.222219-3-blum@kernel.org>

On Oct 14, 2026 Thorsten Blum <blum@kernel.org> wrote:
> 
> Use isdigit() to replace the open-coded implementation.
> 
> Signed-off-by: Thorsten Blum <blum@kernel.org>
> Acked-by: Stephen Smalley <stephen.smalley.work@gmail.com>
> ---
>  security/selinux/hooks.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

As mentioned earlier, this is a partial dup of a patch that is currently
in the queue to be reviewed, however, that patch combines this change with
another unrelated change, so merging this ahead of the other patch might
be beneficial.

Merged into selinux/dev, thanks.

--
paul-moore.com
