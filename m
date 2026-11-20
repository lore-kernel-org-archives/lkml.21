Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795174346;
	b=Aup50GluMVAg7bjR+mKpqu/4vt4JIWoXaXAxcRKcGx5vqOsc/pjsgUIVL9qzxI+f1sKh
	 m8ERZMN1RMJVaU4NvU2CiPqxNYykEmSEY3ZxGdUGutUiNeIfHjFYxHUoF+CFG7CE3Mrs2
	 psLm/saX1XqCK/oJgVv995H829T+fHFdOajWPOGhLfFmz720QbR4NT/G66wYHgMRYBgcl
	 fREZzUY1ls/zfyQ1BjWuIpE0aY/eFJeMNf/3KnkrCj9ugN+XXhrAnyr0fSwjxQ15a+BSm
	 pnQXby4RHPGwd1KkNH7o4rOMKs1Bf3+wmSia3NQHSfGaJyAJtvegqY/3CDztmoYjFlA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795174346;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=rQ5M/egh3irMjrbocw1q9ggI+9luFCL+5wWsNmpgU2A=;
	b=l/0wgZbY1yZ6XprfV3ZxWfp4QNjfHOZldU7UUd3sogwIugwFRyNYIADeBD9sEApnuCmu
	 KI32w5BzydNrblLymw4mqZCz82/OeRZ5AkudunnVMPzKDbBMB0R/QWHm5Ks/3OF6qBm/S
	 HwexjhOdt3dmXeN9xE3PVLObu0RO/EFuocbVC2zanfMjaIZIodxmbGAzPR1Ps5gstBszx
	 xZMIEDAVl1g7Ln8Wj5Ba5qsz5wIDHFr84Zj7zwx8+TFYnvSFKeFO10DmhLoWx0q+umJjA
	 5ha83mJBiD5POg65uE/khb1aN+Fzhn/nuSOILHztnQlBdHA+dhwsfzN2OMd2ozWdL8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=isslab.korea.ac.kr;
	spf=none smtp.mailfrom=isslab.korea.ac.kr;
	dkim=pass header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=rHH5mBAv;
	arc=none smtp.remote-ip=209.85.214.170
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3825606A320
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 11:32:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C3825606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=rHH5mBAv
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2f03920c4a0so4942975ad.3
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 03:32:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20260707.gappssmtp.com; s=20260707; t=1795174345; x=1795779145; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rQ5M/egh3irMjrbocw1q9ggI+9luFCL+5wWsNmpgU2A=;
        b=rHH5mBAvnCyf5BVeI/8RbDkS5YUknOHEdPZvIF8FKjxdvbbWZPbnhXk5b+fqIhITkh
         MXOj5OkHp1R/Gv8C1COn2AKCQfksjkdOn6H198NvlvyOBxsjEgiaSfeCbyHJaCF1PsZD
         2/p0QII9PkM/n8fgae0jCtGPMOoGxk0qHiBxb4rVLu+PvU+naG6XweH/ZAOIO+lonTXN
         kSeRC9HknBYJafcdmNytNF/iNVoh3LNLn0Xy8k/bjfK4R1g8Wn1Q+45qz0fA2W4OR+3n
         t0jAhND84haBEwfyhnkfY2S8kRCZOV85cPMqlY44l5E0ckcCDlY58PvEF0jTHtENXAsO
         weqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795174345; x=1795779145;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rQ5M/egh3irMjrbocw1q9ggI+9luFCL+5wWsNmpgU2A=;
        b=VAlEjHt48TbNYVvrNgUPrzbygSwLkQCxEGt85413thxK41o6mW+n3FKDR3nQR1YYP/
         r9fBSZtnoJ+Dyys7PIaKLT3Bbbm2pU4W1+/Ga66DtWvyNZmyh6/2StUMAMiFDkpOOWUf
         uXidkASOBi6+5UYoiblHkmyGRv2X+5rSGqlxpRgn+8giUQ4tL3jSFmmUOLoaaYkqre4N
         whspoHsQhFFIn7lyoWJSFXPbaSgOT//nFlGT3Cd3LFEMkuRaEfmWWxPruEQSYSt6b57/
         LhPCHfhZihT+z1ObpzQc4u7wuKP7yUvcA9G7pW6BiEy71vXIdr2vpwuNqPfkF5yB0rza
         jyjA==
X-Forwarded-Encrypted: i=1; AL+hErGShaeiwWluj2WNTNYMt/CbNsDLsMGhdQCmQ48oFIVJfMQCy1vNWLJMjyONx18oN/14hsjruQPAnDSLknw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/fGMXH130ZT6Ed9tbrU1PPDvoh3AbPv/1okLcXxvdqwr5zRtmB
	8tcFjTmtAJVuDoP2jy/27tHtN0hJhoJAIDEK3aL+x6js7+fIW0MRrVDWMo0Snqhl2iU=
X-Gm-Gg: AZFdTZeoOh5hIeg+qu77npcbMgAatgKQ8DwBJ+ht5vc+3QXO4QW3/3IKgh5Csp6DDCy
	GA32bXWEZnQfha7MlGGs+UurWWX+V5/yNLVlskVIUDWGpfRbv8IYu3OrREUQ6AAqtV/NkxnDAV7
	3We2mXiR08SrEphR3G1YPqSHAi3isQ8NG1el6i9EKsApNy6b4e2vBxTP7TgH3M83rZFHp/2GYgV
	7p7lYKQKjQ7mwuiAwCCyKZJ4vFityNP1x2HEQoGjWIFkl2URt3m7EdDiCtk5ce3hojyy35QJuG/
	laEo9pA5y2PjmAEtdrLJ+wEy4XEtfcceKv9t0+xQ5op2EFiw+J5i3YsfoeA9ZTFK3jq1vF14Sl5
	OHPvboFD7DbTAN+UZp/LXzqmVRKQe5sJ8iII3NM8+sTPxZtdgS4qYSGMXC+bXsN+pnj4HP32ISX
	+fITqbdCWxRDqx7P7xcVePivODYgUOi+d5BvfwB913R0QA4URkm+hrHXR2vTBfKZJE6n/DE0eTw
	AtWhSX5dC1mwXouMm2s42MTJ58fKnEyQH5JPlMsXCywszhDAT4IH5b8W63sPjv9EpIZ9Ym3simj
	Xrz2n4g250Lmp1469p1UCfDdSey1L2tJDj2r/cyLsnBkuECvIRfRA1y3fd2Pz1hPLo5d1XBEkU1
	MbybGx85ghtR6v2VHob71A2zNGxRF9ZXDwQmN
X-Received: by 2002:a17:903:3d10:b0:2f0:2250:7abd with SMTP id d9443c01a7336-2f03f17662cmr28672825ad.10.1795174345126;
        Fri, 20 Nov 2026 03:32:25 -0800 (PST)
Received: from yhlee-960QFG.Davolink ([2406:5900:1044:110c:8b25:951:ad8d:5cc1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03ee848c1sm13247705ad.10.2026.11.20.03.32.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 03:32:24 -0800 (PST)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: nkapron@google.com,
	Thinh.Nguyen@synopsys.com,
	bigeasy@linutronix.de,
	target-devel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	benquike@gmail.com,
	linux-usb@vger.kernel.org
Subject: Re: [PATCH v8 2/4] usb: gadget: f_tcm: zero the CBW buffer the status path sends
Date: Fri, 20 Nov 2026 20:32:16 +0900
Message-ID: <20261120113217.3063855-1-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <2026112008-parakeet-unblessed-17ed@gregkh>
References: <20261118124005.2428068-1-yhlee@isslab.korea.ac.kr> <20261118124005.2428068-3-yhlee@isslab.korea.ac.kr> <2026112008-parakeet-unblessed-17ed@gregkh>
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

On Fri, Nov 20, 2026 at 11:55:22AM +0100, Greg KH wrote:
> On Wed, Nov 18, 2026 at 09:40:03PM +0900, Yehyeong Lee wrote:
> > Hui Peng's multi-driver fix of 2026-09-19 zeroed this buffer too; the
> > reviewer asked for it to be split per driver and it was not applied.
> 
> Why is this line in the changelog?  It shouldn't be.

Sorry, I wanted to credit Hui's earlier patch, which made the same
change.  I'll drop it from the changelog in v9 and mention it below the
--- line instead.

Best regards,
Yehyeong Lee
