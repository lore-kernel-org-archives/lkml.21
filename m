Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795186920;
	b=JrcY/llP4Tw/ohHFWF9iFuqzHdk9q3UJ34KKYSH9Y/gFoUAqU/56soQL7NB65IglWDdz
	 hmrAVGZF6A1Xm/GemFqkldYY13nIuvIIAWq67sVwRxHhWxLyosygMyAPuUONhv4DAGpII
	 tyVQnomfrTSzJrHWrjZDDKxRLCxkV/ujADCUO0J1GaM54ITG58/g1HD+2TVbMsdJLJsfU
	 Hlwutjkaq3/tnRP9wIXlrUwTIrLFhPUwbR9yV6gGhLolctJcVNpnjijlAX2LC5o+HlsGh
	 zy4qL6vLlMU15y3HRzbYNDDlbuUY4JAqMSxiGi1fIjUdgK9lPGM4+rPNBW4Q8VO3DtA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795186920;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=EQquq+i6TPhSReN9IjVRPVIB6xCEadhlzp/OpeuYVq4=;
	b=Lj2tYgfyjH7MM7c8PotjFLSQH3ZlRUEcStTfcRu0ngNORMGrEIQpg6ZVUJ8N16S+e4rg
	 SPXkZ5ana/89WTR/7qKDiVcAHcV9RBxMEO8rlhFS6yY4I6lWfXObYvfR/F0h3r+OOaex0
	 VeAOGKYqvzd1nAVwQ1mD1N+195+lyK1SDklOK3UAXapPjwuRRkkkmYtI7W6B9kwJYMoDp
	 6uygvvf0seXMkv1qNHxUBA3dK/5O4qqMyvviOHpMaZh/glUXGQ+vK5syj50GxSHVxAjj2
	 dT7+WzdOt5grHeDPPhnxGjRZk+9ECOHE5MOTzxxC+PzM61hMmUjpxpQefxi8dF5xyjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=isslab.korea.ac.kr;
	spf=none smtp.mailfrom=isslab.korea.ac.kr;
	dkim=pass header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=V1muv4aO;
	arc=none smtp.remote-ip=209.85.215.171
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43352606C869
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 15:02:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 43352606C869
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=V1muv4aO
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-cddc597d062so584419a12.3
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 07:02:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20260707.gappssmtp.com; s=20260707; t=1795186920; x=1795791720; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EQquq+i6TPhSReN9IjVRPVIB6xCEadhlzp/OpeuYVq4=;
        b=V1muv4aOu02L+yE4GAaHN7SP6R+7IjUh8YEh5nx82Yg5Xh8xNHmJDgjDfvfC/ucUjm
         cTr8PmTaextdDJKUU+q20INEYhzxAv8g3wboLhaDeINx8UCor5YAwwfK3r77RL79gQUL
         nvI9YZpWdyh4i1CUrh+3BxYlWTNXbRfdNSO/7PjTlU9qOGYrLTO1FJDWavGJgG5lbgQl
         86hOm/3Bj2KivYZhXFdAWXugZftf1SFw1aWrWS5Ft9/E+N4aUJJyvGimLbMVvTQ83pOD
         yL0DzPzHx9IrRc1eprEVMr9D5trEf9y2Nc0wwM69675ETUuocc7UKxOOAj6El/tge0l3
         aC6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795186920; x=1795791720;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EQquq+i6TPhSReN9IjVRPVIB6xCEadhlzp/OpeuYVq4=;
        b=HovpANgABoRfkm2UlyqyM/krXmI9zOgAdBE3wKwPYZMShCYBvsuB8fwWPYMvvWunIK
         QnJpFi8OWEMdbXhJhxoDVaTkZvE3rLNzzsK5sQw413EbV2EyXgVRr+BO1a69FK+T4yO6
         Qg1q9o+g53X9e4a1bFe86zjG6VL2MoSP5OdvoXSuIpSbHhQbejU6gmyOvI38kjKJSlGZ
         Xrrtb++7g2GAnBF7U7GoukrhkLhO+2FKnzZYBuM/u0R1stYMmDoJFLP8WDNJ36jEe8x5
         SySQgyQGmIxIAv1De8zkAtHX1aBG0krxh/QMNDt8oqZ0IpdEljWf4P1cdoUQUL4qxISi
         G4Qw==
X-Forwarded-Encrypted: i=1; AL+hErEHPz6qlDocJN6xOiXpFYyNTY2UFWVuYK24JMKBYCLGHan2tTPC2EwQjojqLsCJMyk0L7DmWugGkM4Tz24=@vger.kernel.org
X-Gm-Message-State: APuU4Z8SW8ywWPskPehvH4MGUL16hXyZd6Jmmej/HdgJgomTHmyHH17c
	tft6PyFRYosNUajedAegbPEvEU2fWrlYO0yhJ/uDkRUuXZozsavxod+u7yefDYnrPS4=
X-Gm-Gg: AYBFou08QpqT5IWoAjp8UGz9gRisvYuBnzOhTcxP6S/7x1BDkQhsOGSKtuHpcWsl0Ma
	JIj9ya4vO25esgi7AUEHIw9NuKNsViy3LG8FytAHYwxHSYFZQ3Yj//wZxy/BIUTEjQgI0F/XFd/
	Aus437WSaiuaVcHqVDPfrcGlveVnxjInZSkjT1XXuSmoYRQEWnyn/fsvrkLUExLKAO+VHDUqGwF
	2wLTe26VmR8EA0nAi9Z8LKgV/B9Qa+4MqGwCZyfm3uOPQf+lAeEblkXC5AMeI+PITpPDNUygzAe
	hktJVlNV67UFaEd3i7vISWaZBNS9IoZxol6NFvp3o80Y0UrpDapKj4SOx9mTE12IvgvpODdCZqr
	KoeR5GDzthBsLheKtZecf3fD/BLx9GyLeXnTinPhcfu2dILPWnNrEvrqQE7XouNysg6Sy72m7vI
	0a3Qg+GosSWA4r4TDKjonpQfLqczbfINmo3mStDCn04CD90oNJX9riGfFTyMiladKkoartAembQ
	gt7xG8BSmAg86t44BiFEut8Zk8789VhxyFD3USa/sKIinQFzLHzXdbssLhUpijlcFGq2PyKPLeF
	CAOCeXytHAp2LuUCgzwPRCCltkVEHiIrNgyMyFr1tG46w5nwPM9RYsMEEaGddMkRqRnKF83r/Re
	NmtM83aiwYPHSer629NH8vaqIrIZoMGR3LOC6ug==
X-Received: by 2002:a05:6a20:c887:b0:3ff:f20b:d2ec with SMTP id adf61e73a8af0-4014dd66078mr3640804637.52.1795186919522;
        Fri, 20 Nov 2026 07:01:59 -0800 (PST)
Received: from yhlee-960QFG.Davolink ([2406:5900:1044:110c:8b25:951:ad8d:5cc1])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6d06503dsm1398731a12.27.2026.11.20.07.01.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 07:01:59 -0800 (PST)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: gregkh@linuxfoundation.org,
	nkapron@google.com,
	linux-usb@vger.kernel.org
Cc: Thinh.Nguyen@synopsys.com,
	bigeasy@linutronix.de,
	target-devel@vger.kernel.org,
	sashiko-reviews@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	lgs201920130244@gmail.com
Subject: Re: [PATCH] usb: gadget: f_tcm: put the overlapped command's request back on ep_cmd
Date: Sat, 21 Nov 2026 00:01:53 +0900
Message-ID: <20261120150153.3128458-1-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <sashiko-outbox-223285@kernel.org>
References: <20261119140641.2768465-1-yhlee@isslab.korea.ac.kr> <sashiko-outbox-223285@kernel.org>
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

On Thu, Nov 19, 2026 at 02:21:37PM +0000, sashiko-bot@kernel.org wrote:
> [Severity: Critical]
> This problem wasn't introduced by this patch, but can usbg_aborted_task()
> dereference a NULL stream->req_out pointer in Bulk-Only Transport (BOT)
> mode [1]?
>
> Aborting a task in BOT mode therefore causes a NULL pointer dereference and
> kernel panic.

Right, this is a real bug, but it needs a non-default setup.  With
emulate_tas at its default of 1 the core sends TASK ABORTED instead of
calling .aborted_task(), and a BOT session can't send a TMF itself.  So
it takes a LUN RESET from a second fabric sharing the backstore, with
emulate_tas set to 0.  It's an Oops in the target_completion worker, not
a panic.

Fixed in a separate patch:
  https://lore.kernel.org/all/20261120113956.3071640-1-yhlee@isslab.korea.ac.kr/

Best regards,
Yehyeong Lee
