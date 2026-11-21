Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795278308;
	b=skt9nkeDb+Ns3+aiWORMZr8TXbgjDJ9s8y45sgMX4zEwbb5LcK7OCoveayUsUCi0sNOw
	 UseaSCQ1ZAOSdwsGQLR4UkNzOyBds0A5CyC5LYHD6Ts80ycmilQ9GAe1NwCDl++21YrBW
	 4byffJu9d/Dml3ZV75EZYDOcEvGGCA1T7MyElcC4puGdsBv8E+OGmt9V5LMpj0i1RXcrd
	 WXGfmSfp0ZIeLzz1QiTewJZHMuCc1tx4o84b6UWVRwqNQ+Sbk+xStqBn3zqNNsD1g8g+o
	 JCjGh1yrX8L+p5BH+PIUKiEpfGCbbBqv2T91Dytl5YPyYKvOE9wwrgx1UV2ZIBpAeqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795278308;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=36d9hExkEjPtvmQtsPosnEH+c8Q4VXKpCfV8tJSV/JA=;
	b=UuqzpTZTul+sIENRyJm5ngT+EQNCZMiCiNmdK3Pb8bOI/44U18wXLBUz9fh7AOCo3l3Z
	 EFc72QWzl8ONVqbPoisMpOaKVmuKcIiXtUQoXVtnGBEOkCDv9zt/j4DY/zTA9V7TlqkXP
	 UhtPTr2AYPPAvy+lXS1YaW6tuLU60CWdoJucP1TEV38zUeVxkJZ2zz7MMaYAY9BfcI0i5
	 +fzhr0UFPoevqH+rwn/H+zQgEaLQVw0zmHJW726GEFOpXtjV33kOAMWqQk9STguvThibI
	 0Dc8P4KTY3k4Cn906gKEhsFeN0fQdPIHmWk8nZ182Qe/PJhL2QW+/F8BzsvGiTc5JPw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=O3HKPdoW;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21659606A320
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 16:25:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 21659606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=O3HKPdoW
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4bb666304fdso26693445e9.0
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 08:25:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795278306; x=1795883106; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=36d9hExkEjPtvmQtsPosnEH+c8Q4VXKpCfV8tJSV/JA=;
        b=O3HKPdoWDNlPpa4GOqunHzCTOD1ZVBThTLWBXpFFL/kUd7IRONtBl1NCeGle3gaJe0
         TLrXKknF+bo3AhXUZ4MvCZWQHGhSjvSQb6qHzkXFHzfBjaXv6NVVwASnyw0ChS771Jkj
         UaaBZ0pdSI4rh4tpVo+Vmu078rUgFe72BGiF6u700rTFHEPZthcO2ITFQd65daXyjLsy
         NBY7BBGQTd04dJ6pJg36HFvEKRAJB/luGkzwuw8iiFsYf885AcgS7RotlUHRlQjgG4In
         WnABRBs+PU73ATkwerA2nS4QTxMLCCDAWPYKEJ22/tKKH3QocFpKPmbtYN+aXDFuf4Ud
         xtJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795278306; x=1795883106;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=36d9hExkEjPtvmQtsPosnEH+c8Q4VXKpCfV8tJSV/JA=;
        b=xk7Pb4wIY/98kNsqYEYgTw5K6fm3/lPbBsU+BOhTSrD/s1rmg+oMxSFt2e4kslOpzg
         iU2VU7haeRWj2F4tzn1r3nEW8PjXSqNUOCb3P68+IGL1TpG5HwGBAWrzJFSKH1YVEhdm
         R8pXhredFPcoA6C5cHiJoEN2IIe4XIpvLZjk2bJSIN2AehXBzjfez/AOLbEYrp8dD71t
         v1jiJzP7rhtdTqkLmZlqCpXj66uL0nwMC8jWGWt7sJNgiLn4/OFU/9LTbl+h03xs5BS4
         LzO6ID0OTKbsBHsMmg6RK3/xrb1EW1eXP3/bJCoZaeowwj6x133Io7VrBkw8od563CcO
         Cnkg==
X-Forwarded-Encrypted: i=1; AL+hErHbEhRsAqz/F/9buK8aI2M8AvznaxihAHXCKXTDEHJRQPnl9rF6KDJG2/judLx+0FSXFZP48+F1HdnaBAM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+CbU1hcfLe9O5Tb3WQ8nT1cHvlyqGszfBrxLkadkPQV3satU3b
	XR9yhOaU6jP1hDJRfT7Qdgy4RVdU3Uk6RgCDAJMTXQ6cUidorpEzECWT
X-Gm-Gg: AZFdTZddXEAAyammZYpgLTBayAk2exScZq/RarENEVA/3RASS7vHUfGtt2RAuq3AviH
	0CR9KBlQrCjhmWNKZ52zJEwPfUSw/ZSmcQEKotacA4NmgGMsG+jRrGx/oEzASF3CdantOlqic4w
	ylo0ADlT/J9RakCOjFpYvvTz4zlANXcUdclktY7bzSk7spmOecFt+l/8SwOSMSWShxwpFtY0Ek0
	N4G6WavmT68lXbZqPFn5JsGGOAdibRJAd4IC7aN99RDcIpv2Bw5uBVccK4lLzpmSpJ5Q2042BWS
	f4A46sttJ24EJDpSOzxFV+6hcGynfuvjk0zMEeUIJqHFxDq0xfNVD8uRVIOvGjNHSFTesTvi8r1
	Aoh8gK8vmqcQ/3il2ZqjiOHweW8LVc/4avhZECs42KWPkLGZ24N7DeadYIAkQHmxbxwTuGuO7j3
	6lg4toRhwCNMDOLajKvh90/K4stHJ/uvsWw9nuakI+93mRhH19HoHaJXPIN0dhClrzxKLON7W0Y
	ua+ij+S5XkyQ7M+PFJXJ1C/rLq+kFtXQDpvQkD2ZhFQNOGqJ1QTebIlM13aI+olZrpHpZZ+LioX
	UdWGtU3uZ+Fdcr4IJJ9674LO+zEJc20t91J/zGEtkZKwlVVxijsfq67Z+1Hqc3C6dmc187M5xVk
	47C2Pu4c64mOB
X-Received: by 2002:a05:600c:5303:b0:4ba:4928:8aec with SMTP id 5b1f17b1804b1-4bb88807d7cmr140280015e9.9.1795278306276;
        Sat, 21 Nov 2026 08:25:06 -0800 (PST)
Received: from 1Z10 ([2a02:b123:8010:2d5f:cf9a:376a:baf:495a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb9066e34esm67580365e9.3.2026.11.21.08.25.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 08:25:05 -0800 (PST)
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Maurizio Casciano <mauriziocasciano7@gmail.com>,
	linux-media@vger.kernel.org,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Nicholas Roth <nicholas@rothemail.net>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Bingbu Cao <bingbu.cao@amd.com>,
	Dan Scally <dan.scally@ideasonboard.com>,
	Hans de Goede <hansg@kernel.org>,
	Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH v11 01/14] media: v4l2-core: Preserve existing subdevice nodes on rollback
Date: Sat, 21 Nov 2026 17:24:58 +0100
Message-ID: <20261121162458.1373638-1-mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261121135349.GE2472094@killaraus.ideasonboard.com>
References: <cover.1795267528.git.mauriziocasciano7@gmail.com> <48240d57d86e78cce814822360c1b22cea80268b.1795267528.git.mauriziocasciano7@gmail.com> <20261121135349.GE2472094@killaraus.ideasonboard.com>
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

Hi Laurent,

> NAK.

Thanks for reviewing. The test only checked which nodes were removed.
On re-reading the error path, I saw that unregistering a new node can
invoke the subdevice release callback while the subdevice is still
registered. The test didn't cover that ordering.

Is that the issue you had in mind? If you see a different problem,
could you point me to the code path or assumption I missed?

With Best Regards,
Maurizio Casciano
