Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795186782;
	b=bfJbXRUJcavZcEYocMTUxlMRquKmoBrneG10z7ZukXoo3dBmZZqEdRNCmDvIDg0oLxtc
	 sypubFXcULTuXJu8UH2BHdPfIpZR8C1BJ2LWL7kQzozlylLqZZtMQYHzsB5y8qF4061rO
	 K3xX4YqMrmq+YdMmiyxof9jsjJdS5hMcyoVTik3XeaGvzpZOaeY8/Bi5HrBlrQN/ghTFx
	 zcTQjZ1lMGvwhKG48GjorjxdBBkaXcn2MGEXcJGtS1SxIC2vFU0SIKk6l4y8/8pFlHVWA
	 g7tvAQOH4A79RPNaevvhu96crecwf+yF5/eVKECCfTxhsDHpLMwcdihqDCb8iTkiRew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795186782;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=NPBcu9gG2nBjvQprQjdUT03YAkNr0CT+CriE3SaJLQQ=;
	b=YSx2FNL7khRvSRLv7WcGEiPFDwva/PmVSMQNdtYAPsTvOQpLu0Xsv+9twyyQBOMGZa/m
	 ziNR5Atoon7A/IL7YNSWM1qbRvsnq94xRmQwtWMXuUDJnWVVxDhiHm3g7qQKDBiS884UG
	 Hw5mRzm8FgH8QKaMhSaEnPMGVMVa2kPgbfQYeyFxJpXVCjgHFcETzX0S1AsMRpPrW4oyb
	 SeFkmr4orf6+gyxHCx6doSTdHpa2FUz0eb2H1Jg3z9sRxQEX3YrYZ4Rx8ZaSIlz+i3rPg
	 G1hAQtC+vFLIRZlwVdx3aE8gfaiKJ7fxmT9GhiEDnq/3DqX0oflBRaHdw/07kJmm2Fg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=isslab.korea.ac.kr;
	spf=none smtp.mailfrom=isslab.korea.ac.kr;
	dkim=pass header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b="Fq/74hVy";
	arc=none smtp.remote-ip=209.85.215.179
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE8CF6074D1B
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 14:59:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EE8CF6074D1B
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=Fq/74hVy
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-cdb75699c7cso408711a12.2
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 06:59:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20260707.gappssmtp.com; s=20260707; t=1795186781; x=1795791581; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NPBcu9gG2nBjvQprQjdUT03YAkNr0CT+CriE3SaJLQQ=;
        b=Fq/74hVy1H5DfMJeJdAJf9Yme6F3FwG+c+NGx8aZO6aEjIacj3quu0sOLtOBtXKFpM
         /t6i9RIgcI6A1LqziVasuGIXOUfLauW/16YJ6GpxubhW4PQzlHtmyoMa6JQy+tvo5p3z
         kmxr/GqAqQge/pdhL0tGcsmJqMk0t1s3DnVWs3QwWUq9gwyD9u7htr7wYm3OBW0dlaTV
         Kj8cNZhkUs8zshB6iF7LsT+b94w2JgZHoE0a+R34tagG7oN9e/aJupOnekBBkL5Fo9/g
         vZWRuSm9tK8iZ8CwYOAQ4yVU8b8/hOLdOhrK6GNMYVPJ3l9de5bi1HKfy/gn0n9pUAp0
         8RDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795186781; x=1795791581;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NPBcu9gG2nBjvQprQjdUT03YAkNr0CT+CriE3SaJLQQ=;
        b=KzTeLhKvjl5V9AEHwE+Sp0d8UXUh9Y2JTT7H65Dw9o6juh55O4H/JHU6iR3V9YZsUe
         cnqGI2LEd1aahuixOTW3Ojbu8AJqIWIKd3BCSK3vCViIhTgbBz4FiNmKPvpHXQpAYhQQ
         gzj2Gma4rPF5L3XlkUmVEyaG3/b0+g/N2XDsWHfj+ZaiFFr9bXLsyZC3IRuNYVDNrJoH
         tQ3jeVFTWl4Ml8rc7kQCwQrJcOIheo/sLYaJKXM5eHZrGQjpcKSoVBsHbyGJ83W+PR/p
         52FwXSmZQjJMflusQvsbOqaR9o/1lh1Pg41SghlW1MdZNQZFGldtAFgAXDfYe3EF0Z0b
         y+EQ==
X-Forwarded-Encrypted: i=1; AL+hErHyZccK6A3JoByHvGK9PS72OKFTbTEeqG/n9QDrCb/tpUyRBr/c41kYkY/H7DkjJbqxfM5whCGR7zo23cQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+ESx7Oy7JcPI7Kvd9poh/korc1bo/+qJb4YiP1GQJIdhGTwjGx
	KIaRHj3gvEmaeudl+LrtEdHGV6b3PGInPs3ppU4KfK+wsTCiQrcsN9C7WO9mgMNy6/Pe+bo54j4
	9GBKL
X-Gm-Gg: AZFdTZdTvgIDb5WFLtq16ZvYJ5pFjhBiwayfp6pT+HtJo1pYYW0jttW3AAh4O+cWJnq
	J1gWj/lLPyc0XTr7dtGKYuUquoD+hTLnZDdCBGvACzClhnGExwfMUGpSr5tRaysrh6yP3thekzV
	UGJzocDMKL8GEEcN3yBf0P/nyONZ7rJvzVclChbTSN1TYeW3CBCcnrJYfY4AU6yNW4A4VqvRPnJ
	1rsQMJvfF8nEjsrMFunQQrKBwnKf+GCpxVB+rdrHH+A2ZCxcmEXK/87gNOq2rCbOjj/1+AEbDpJ
	Q3APY9Xy0X7/kn4vccFSQMJzj1ZBxQHKdtZ7y02/fK07A/t6JhRZyInmvGoI82sdXXxMsJfM+6a
	d7OCxwUERCGRpS695TVMwcJTmuzvCnnNWif1ewRkv1MBF5VuKOvXJvokV8nUZmsJCddU/hVHG9e
	Zh6sYHQeT5j1b8oa4EvThPrVrjT+HDW0pDPZdaQgqNDTbBpn3c+DkmOkZBnHaEWQclUK3ccaaAc
	TrTRz3mIPRlUsgTb8nwEudV3KiZvaplZg0HbIcWSweoPMg3mXSgB3ldFLBCxhsr7hj5xTf/8uwD
	4BtfUo1snPl8tJjbhpkLuxZYGOoJ/ycgG3TDE2Cjcjm1Cu8OHhgJtE1ErbF9/iBb2KtjnkU04qD
	/E5SOa6QUEBPxN5qZMfxRXFj+VB3UGZPG034j
X-Received: by 2002:a17:90b:2d88:b0:3b4:e6e:1aba with SMTP id 98e67ed59e1d1-3b41c96fdacmr3133157a91.59.1795186781357;
        Fri, 20 Nov 2026 06:59:41 -0800 (PST)
Received: from yhlee-960QFG.Davolink ([2406:5900:1044:110c:8b25:951:ad8d:5cc1])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405d63728sm8364718a91.8.2026.11.20.06.59.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 06:59:41 -0800 (PST)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: ching2048@areca.com.tw
Cc: mkp@kernel.org,
	James.Bottomley@HansenPartnership.com,
	linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	thenzl@redhat.com
Subject: Re: [PATCH v2 0/3] scsi: arcmsr: bound adapter-supplied completion indices and message lengths
Date: Fri, 20 Nov 2026 23:59:36 +0900
Message-ID: <20261120145936.3127939-1-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1791792888.git.yhlee@isslab.korea.ac.kr>
References: <cover.1791792888.git.yhlee@isslab.korea.ac.kr>
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

On Mon, Oct 12, 2026 at 06:01:45PM +0900, Yehyeong Lee wrote:
> The arcmsr completion and message paths take several values straight
> from the DMA area the adapter writes -- a completion slot number, a
> type B completion-ring index, and an inbound message length -- and use
> them as array subscripts or copy lengths without checking them against
> [...]

This is superseded by v4:
  https://lore.kernel.org/all/20261114033810.549787-1-yhlee@isslab.korea.ac.kr/

Best regards,
Yehyeong Lee
