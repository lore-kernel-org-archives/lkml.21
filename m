Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795186846;
	b=vXu5MFJJwRXcBE1zIIvIw5GnsvBs/7JZKYWzV4VQmxZiBu0bqFY6Kx0O54ViPx2b/KYJ
	 fIiQkgHbUqRfNoFmCiPy4Yhw6xjvJ8nwav3aQrTANGwXmYBVGewaQqEMxKZB7AMMpB5Wh
	 qoNCJb4/JKIhvmMxbP5g+9pOwnuRG/ITs7/1SbS/EjB0jPe/CyOuxsvgcWp2WAgsj/2fj
	 QhlrpkOgresmn4zTAIba7eT22bbAN9OPH7PTDJ3bOjJK4FZBiz/7el3LjCIFnganTXMyd
	 9ZrxCpXIC1o8kaa+mx46+baaAbZKApaXBllrdliCsdMK9y3Kt5L6EyyiY7IANXnMpgA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795186846;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=Fa3jcQyOThRROqmsTn8P0YPQgbosLQuovg70CeMmiGU=;
	b=fA+8mAqzKNfoW1etBDHWlWDWuYCyugp45XzkLgMdzCkKOPNpB1Q0Jb3t5I0Phg3Rx9c8
	 aMZAbUFEaAyOGoSXXY4ftZ45hiL0JfHJfqfVbWmpvvNrmwaAznDC+/M7LkVGtHi6Fu/JO
	 FAZY4qfNot62Me0uVslULKAFxfCR+OTgCxgPFYyhe+UKVwwUmqU1yqU/yk9kA8maoL7qi
	 pNW7M9M75l/po6p7oqmeTldz9i5K5TuZjPo0dkUOpJUZRoijYxxvGfRotoO7j8Gyc0DMR
	 e3+uw6uBEnjjOPoC0YI9V7wYcqyHaxacxNZGi6F2tOtG732PKSmQGSIBNYfckIrwCLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=isslab.korea.ac.kr;
	spf=none smtp.mailfrom=isslab.korea.ac.kr;
	dkim=pass header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=SlXPIqsG;
	arc=none smtp.remote-ip=209.85.210.169
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BD226074D38
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 15:00:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7BD226074D38
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=SlXPIqsG
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-8b32bc605d9so534715b3a.2
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 07:00:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20260707.gappssmtp.com; s=20260707; t=1795186846; x=1795791646; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Fa3jcQyOThRROqmsTn8P0YPQgbosLQuovg70CeMmiGU=;
        b=SlXPIqsG2md1UteACDeJc5cyUDKIPa03VJqDOnm+BPxH1ub70V0LswUa7Otskrkn9p
         SmJMoi0AXDXaSfMZshaHCh3jKN8e9bAjboEnXxx/it6b8DPSRo3lnxKl6hnNlHuYEuHt
         roKqklRcild9RokAy4HDYXkeB/recYz181H5/e7a+zldqVJpU3YMeLnzLkp9LMq/qqcn
         71zztUcU4n+5ylfztm+R1tuKIuS+p1V87w+ruJUEEGI3rT+JMTptLTVRR/cw8sWMCTzW
         3TqCi9hxZrRpKOaNqahBL5STJus6k8tvXHfbNqY5Ol1VGAiH8/bGFTLrIKk56SQu9Cwt
         fo/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795186846; x=1795791646;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Fa3jcQyOThRROqmsTn8P0YPQgbosLQuovg70CeMmiGU=;
        b=SVlew3lZdLK0PoZRMFpkpl5v+J7fI0FUezbLexsASxgWtOZGqaJ18ujGaeUyXWqCKQ
         EzeJryMGYYP91wzl9qwAu4RNVeQT8n3NjrJxNpf2dizrMKnEv8oQLlLmRnHw9gH58ODC
         Y9lhKStED4EW4RadR8rjaV/80S6TFUCHrwS8/AyrWwqnDAuX392ZlijMqRRaedrzWbGn
         SzcNLrLHTZ275DhCBVveUa+nyfjhSdHLT8R/jPBIC9pYx1B4NfsjD74gSl0Cqn0pImBG
         Byyp6jRNDTMCJlrEh6vXnFXmMNhXjqsly1wbjshDnqCSMeshsPsg4pdG5jNqV2hTocva
         a2IQ==
X-Forwarded-Encrypted: i=1; AL+hErEcl8W4HhMt4uoeH5A78gwC7pWkmi7dWzPONEQacInbjyLiCBUunZZRbnlgjkIl+Tj15MQ6DPKEgpTUqWQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z94Uzlks4nq2bKiNoFafxfr66wYBrSK/ENhsx+OT7CZe0VFq3QJ
	ggYfE3uQ7cgWe4npmKUiZkgUXOnaTSYZ2oJXUkNndfr9ag2b8cfhIzkkZehBJ8poikY=
X-Gm-Gg: AZFdTZfixiDdpYdreu13jRB2mxOdfd3r+9e8MPzWsYutChzzit0bOuMTCnTF24LyhOs
	NJ8K+x/9YvwjPx6W5RZDDLFTBB3isFElEGy/lpfWfGyBuZOODtS8NYW4oxIk1DWD8+VIkKSzpEY
	jRal3dRGYVnMz68YPMdq12dapIZWKtYH5RRxPsJxDR7shuvipqWao0hGMUAZsNG6S+AbWx2ou/A
	gyIKY2NIsnY4IW0Gk09Xu5xC+Agu9rXEI24xwJ9tt9nbA8UaDgZQs2jRNAfg4DzDnv/P1MOGIIg
	DWe+z4i5lKAA+kRI0boy9T8bSpkE+NBEWIlf4vsuyU+vyAh6JlYvAyKTXrYb6D9mgMJKX2xBCRC
	W0jwmKeALsAVGgutLcR44var4ZfnLDIIdwVfhdudnRrhyWicSafJDv4qXG7MHjmZa57F/DIcsfW
	FH2CFc36S2TRNDQfxSwAkXzh5G3SINUUpH/JOrHU+Gfa4lAPBKIk1l/r6n9alYJVLurfqoUnZCz
	Jk3Dvhl57zp9fZ9MSVjrt6sNnW/lJYfLmKq9IkpiLen4EokGlYFqIspAeN/42hRuBvutSN6QTRH
	hz6JZKf0W7SXFMlNJThzJioi02LkCWDVGKqykG6EVVVE6j9B4zlPI5T0fFkIw366un0sFiudJfN
	TCQwjw3SO8VtfwekLWsS07b46v5X39PCeHlqi
X-Received: by 2002:a05:6a00:170d:b0:885:e2eb:23b6 with SMTP id d2e1a72fcca58-8c87b9cfab5mr3322192b3a.11.1795186845677;
        Fri, 20 Nov 2026 07:00:45 -0800 (PST)
Received: from yhlee-960QFG.Davolink ([2406:5900:1044:110c:8b25:951:ad8d:5cc1])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c873c1cfa0sm1603535b3a.48.2026.11.20.07.00.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 07:00:44 -0800 (PST)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: mkp@kernel.org
Cc: James.Bottomley@HansenPartnership.com,
	linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] scsi: aic94xx: validate the sequencer-supplied EDB index
Date: Sat, 21 Nov 2026 00:00:41 +0900
Message-ID: <20261120150041.3128228-1-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261015072612.4144043-1-yhlee@isslab.korea.ac.kr>
References: <20261015072612.4144043-1-yhlee@isslab.korea.ac.kr>
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

On Thu, Oct 15, 2026 at 04:26:09PM +0900, Yehyeong Lee wrote:
> aic94xx derives an index into seq->edb_arr[] from a byte the sequencer
> wrote, in three places, and subtracts one from it:

This is superseded by v3:
  https://lore.kernel.org/all/20261015091747.4184349-1-yhlee@isslab.korea.ac.kr/

Best regards,
Yehyeong Lee
