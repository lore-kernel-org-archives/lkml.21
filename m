Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795358315;
	b=h0bfulHHXXMyYlzWzE4llG2+2wJamMV0QwTywUwOG7T58s2AT9SkNJxJ4RsiFnjV2igf
	 c+2lmxUYAinC6olPkJL2F2a1XLEDHY+79hdiPotxNmGxOW4dFIwaX187XPGM8+CUtNNyh
	 UIOQIY0ejZLCmRS7MANsXKaeoNQYzbd03G5r7J9EbHHYd0XsZvdNbuvtsw0r793mVeNcg
	 jBraOzsc4DBk8UwBdYolZSV4BttaaIKaGnum5XwXl0b3SjWlVeyLGOMQsQcG1YYbMdl0I
	 NSKJnbSqdlvk0nDhSaCbK88FibS1ah/9Cio8+/iqQEjeyZnTBtK5/KtKU8qctIB9dDA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795358315;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=m+lBzUtZbcPnxrRlj2a5ONA5sbQ6rA0NyyUMApXQnAc=;
	b=ahaIyCz2XERN1IgqFsCrwAJ3270ZyQz7095Fu0LWlpnzfXfApfAhBdMDKVw/Cb8oTeOt
	 tJxspjB+uUb6FCDyiI/J6mO3nX7iwhimTtmLBvjtTwV6c3JzVwqLCwogx/WNo7Cl6Ne7n
	 PtJWb+76SN4QdI9IYKg15SU6g8WBSiybtYUMYZm4goePjgi1I3o5G5JH+c82EO2FxSvLY
	 wjABf8Lf8g40ZSW0ZpoxSg6dSk9HY8m5C37PZfyG35LcaFdin6pFN/ag7OhGKuok3pRlX
	 cezUEflO35cggtfbIoecVeCbfu5dxYiIsuqNoRpdCZ/YZlhjqf5sU9QtRa2Dfo/UCpg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cs.unc.edu;
	spf=pass smtp.mailfrom=cs.unc.edu;
	dkim=pass header.d=cs.unc.edu header.i=@cs.unc.edu header.a=rsa-sha256 header.s=google header.b=AfkFgl4A;
	arc=none smtp.remote-ip=209.85.219.48
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED12B606A335
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 14:38:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ED12B606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cs.unc.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cs.unc.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cs.unc.edu header.i=@cs.unc.edu header.a=rsa-sha256 header.s=google header.b=AfkFgl4A
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-92125687442so24339096d6.2
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 06:38:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cs.unc.edu; s=google; t=1795358314; x=1795963114; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m+lBzUtZbcPnxrRlj2a5ONA5sbQ6rA0NyyUMApXQnAc=;
        b=AfkFgl4AHUA11Cz2zk8WBBwMK+X/HIDzRK5+MYdyi2ng/C7wpuCEEaLWnoeurwqvhc
         un8Y9P/KDffzAn5QBJDeL95Aonms5uE7VqyjYxlDXnsQ9+vnFoScbxVFG7Dr/LMkHOCp
         YipueMC5yBS8tK17Sc3TAIfKjE6glUoTJx3lJbFarCR4x9CstDkU6KBjnKZ5ECcdXJd7
         rfX77s4AmQcKf+/3t7duDnQDJEudfPbSV1EUFq5u7GTJj3K8Hfuoq2MM5UZFPpsvLmsS
         z8Eiy9QQJzDIkaBR72BN3SlcRBurKtzYxdgpoEgVrs17Nz+Iy/+xd8YUONSHPtLaM/3i
         QTRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795358314; x=1795963114;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=m+lBzUtZbcPnxrRlj2a5ONA5sbQ6rA0NyyUMApXQnAc=;
        b=Be5zZYwZb2gkxvBDNnLjCehhmBtDJe/nyRfDqW/DlfjuvTMkqar6+gPbdSlQF4ianY
         rsjEoluIN6hwdNRQRrAkO+/K7wiHtpWTUHMI1uUW4Ri9iP2P27OPmkz0KDtTR14FvfBs
         +nZFZ9OGW6/gc0KZccH24NmsTjQUP6a32iJOWYEAWX3sgqIcdkXIVfaqjUY+bXjwEHB+
         KgI9FuigVCFEiBpfZ03dq9FdFVRLdkZiiq3ZPjddKPaZKzNv45xLs3eZToRVjOfeBuLE
         nDOmiOr/6qsdfl+/jyD/PeIjij2J2g4K6VlEmT3mV/qUFjrb8mujpjfPWpIuHZ9O2Yvg
         HI4A==
X-Forwarded-Encrypted: i=1; AL+hErE2P4uLhRYgAZ8Q63Ly8+je91yToDADm84KCcftADHvVHMyX5BrngF0aWLQljJwkH6rtvTeNh2Wpi6IMpQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+O5SUF0NZy5/xGdp1Fpdb936KTBcBgpxS3EEFUEVO0WFox3YT4
	sky7cdmsPAe408q1XeCZCTkpHRXAOm6+gvyNgMy3NELnNtNWDJCyxbcwR16eS2EUSFjhf0ZAy0S
	Y4xs=
X-Gm-Gg: AZFdTZc28U8Lq/+ZKLzzOcnLbYsn9F6XkNEt9lDOay4/+JAzWcjLkbK8owdD8MEtWj+
	vIcRDK0ala9nBSTD56F+dozXz/K+VQdittvRAW35u7MKfpo4f+dOWFrbjtt2JWk7nTOeSlm1SXc
	IFxJk595B80b8vrSLl+5ZZ6MFFZzg90wY1eeD907g8R7ko/loCdM1iNnc69DuSnETHZwEg2rW8O
	YdyfmLs8eK+4nUPqCB0x3RM3l+mRyTyfIIjSp6aHbLGX6/q8/4MpEiwAHYe8i/M83ePRhXppGyJ
	qSyS6WNr8+z+tc4biIoEWPeBuqeWvyKQuNy07jfW/pk80nWyIxu755g9tmRsu9wPY9SbQsGgzaz
	U2vsohxMrQHdf8yAvfEo725fM7esOk1iotZcuoFx7AgLxidkIw2vNb0NB4905FgllsGXql2rh+y
	zNF3TpW47kXXUxIR49kkU4IGid6frm8Lk3j4Ooxo+h4pZL/zBomDwI9/CV0ftQeyegQ6MSm5veP
	sTQQzDpTmXIVvaxp/PQNbZuDjZqVTQBitB8Rp9TArQWMoIKSbTkgnsUjytaViOTXCI8OxSoH46a
	QN3MrsL4ZZKo4ag6WcOiFl/Nt0QmL4O6LxH8+R2FogZvuKbNCG68
X-Received: by 2002:a05:6214:5015:b0:921:8d9:7f8e with SMTP id 6a1803df08f44-92134a6ded7mr155188986d6.12.1795358313858;
        Sun, 22 Nov 2026 06:38:33 -0800 (PST)
Received: from cobra01.cs.unc.edu (cobra01.cs.unc.edu. [152.2.130.143])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-92134a16754sm79665516d6.39.2026.11.22.06.38.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 06:38:33 -0800 (PST)
From: Hengyu Liang <hengyul@cs.unc.edu>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Jason Wang <jasowangio@gmail.com>,
	=?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>,
	Paolo Abeni <pabeni@redhat.com>,
	kvm@vger.kernel.org,
	virtualization@lists.linux.dev,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] vhost/net: bound the count of VHOST_SET_FEATURES_ARRAY
Date: Sun, 22 Nov 2026 09:38:29 -0500
Message-ID: <20261122143829.2674252-1-hengyul@cs.unc.edu>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261122092235-mutt-send-email-mst@kernel.org>
References: <20261122092235-mutt-send-email-mst@kernel.org>
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

On Sun, Nov 22, 2026 at 09:25:37AM -0500, Michael S. Tsirkin wrote:
> this is followed by:
>
>                 virtio_features_zero(all_features);
>                 argp += sizeof(u64);
>                 copied = min(count, (u64)VIRTIO_FEATURES_U64S);
>                 if (copy_from_user(all_features, argp, copied * sizeof(u64)))
>                         return -EFAULT;
>
> copies at most 8 bytes.
>
>
> did you test that this patch actually helps anything?

That first copy is bounded, yes. The unbounded part is the loop right
after it, which is outside the diff context:

		for (i = copied; i < count; ++i) {
			if (copy_from_user(&features, featurep + 1 + i,
					   sizeof(features)))
				return -EFAULT;
			if (features)
				return -EOPNOTSUPP;
		}

It reads one u64 per iteration up to the count from user space. With
count = U64_MAX and a large zero-filled mapping, it only stops at the
first unreadable address.

Yes, I tested it, on the vhost tree at 44293796526f (KASAN + lockdep),
count = U64_MAX:

  1 GiB zero-filled mapping:
    without the patch: EFAULT after 27.4 s
    with the patch:    E2BIG at once

  2 GiB mapping, SIGKILL sent 1 s into the ioctl:
    without the patch: the process is reaped 46.7 s after the kill
    with the patch:    the ioctl has already returned

I have a small reproducer (a few lines of C). Since I found this with
the help of an LLM, Documentation/process/security-bugs.rst asks me to
treat it as public and not post the reproducer to a public list, so I
have not included it here. I am happy to send it to you off-list if it
would help.

Thanks,
Hengyu
