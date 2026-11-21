Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795262610;
	b=ChlW+t4Nn0iersH7uSkycq2QtaDwg9Q4vmtXhjhLU4GXOIONKOK9tG/T8DC+cqHLFU5F
	 eq6tmBlhTv9vTDpRDkfn7EvP2shSObmXMYVNjtTzpXASU5vC5J+VuAEyI8d+pABCmDXvU
	 wepdrSgLx5ppvWili5/kPRlnOvwCvXKzFccMg0TO0LXa8tZn9As6O7bOzconZQeg01Gie
	 PG6l+43oGp3ZDE5vatgdHZQT+A8DVNr3xMs8nBPpkUbVWRS6OVCTTJl46ZpD88wifShl0
	 T1C/PIcVbzdIfOvrvWqOHf+dxt3/5zP9L1Rh+V3WVmSFGI5fUC2u5Z/U3py5wo5lDhw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795262610;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=vPA6qcxIxzfcfFCB423ZCb64SHQJPAgmU9OFUPgc7HE=;
	b=doJpqK3hrvBGceCEG9FrWsjTvaeRhYNzaEGtPe0zLymqY0O9IrMM7lPusHtECLs91Q1B
	 5LaQgS/7wr6SX+DNY2/zjgZGQpbFTCRDBQrdK3OR2LSJ1Hvgrp7F/cv/3K2jmALRyB3qV
	 OnFY/WC/PLrdw62cCasbZ3zy2n6ZqP6NjUGaOannvYToQ1D5Aa46kyfNpWvw4KrXo4v3W
	 5cPVdE+meRnWbo0TRPL0g5rpzG0jBbHNIRtJpTkANbSrh3RiBgFxVl0fnZqEqH03uO2vU
	 lUYdfzyVI9lc3TQKEIsYovXmmZZC/aX5NNpAb8I0shLYeq+UBpQa3jO+VI3L14D2CVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZDAdsEjx;
	arc=none smtp.remote-ip=209.85.215.171
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 280EE606A320
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 12:03:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 280EE606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZDAdsEjx
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-cdb2e0062bbso697914a12.1
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 04:03:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795262608; x=1795867408; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vPA6qcxIxzfcfFCB423ZCb64SHQJPAgmU9OFUPgc7HE=;
        b=ZDAdsEjxlM5KAW3sIXGD7VaXwb32RltnO4d33r25eBtmGYJgqDeTnuefzeYZShjpKu
         U1BWk9ye9ApCfPvuORkg7OBigwKMcJDockUnfmRTHk6JQooPhQmRcl8ygO6J8oq9IUDJ
         ziCOkVgdqC/QBb03jJRTT+pnIZvtawwp75Ppm89rnKwcKvQMZhXgcsemnS01FZ8T3d8i
         ojcI9o9JsYmepqn/fLjFPGRNg7EOSaEce2UlDWqgCXan6rLfFJmigq/ifvFsyXodEcbC
         5LRI+IR0tsUntUDln+IjF8ihIwSbno4lEePqTm5r7mmZq2AQiTaPEBqJk1hkx/HRrFJA
         +p9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795262608; x=1795867408;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vPA6qcxIxzfcfFCB423ZCb64SHQJPAgmU9OFUPgc7HE=;
        b=QsLAvRxAreJivcD5kyh9OI4f0lrgfZ7oIQdw2MZOKxURkwkpOzRvUE+L4TGSiXBJka
         yEEOYx/XG7tIZseUxZLT25X5DjxxGLwCr4paP7TZ722ITocb7dk2XEg/B3xN+BqHc3jk
         1Um3q+1Iz39xlJZXrFpLuabpoiVJ7WTF4DnUTjTo/apicv+zC35UNCGFoi9QHfZgacFr
         mPbwsvlqKYR0EjmLSkzChJTWOoAxbQvkKERJtH6Cq8d0mRXH8NyL+jMxVMNQZIHnmPi+
         NrejAAzf59mGbxuXYoh9hk28IZ+SQA0FWEoCV9j+GcH8fe+2ma8oDfpFcRDzyFZfZ9n2
         vBag==
X-Forwarded-Encrypted: i=1; AL+hErGbjMztwaLKlZAM2Sck4/aJ99QiNC/cqMt8Q7N9wu4Rvgx5DaO0Ae9U6ABn7emPEMrIxuUaufJQkbUgGcM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+GVYeagt4dA4ZPyZsqQrXO35n3/0Jzf4V1rPtiSCuFJBKrGKfn
	+QxElZEubKylQPTa/401WyEWz00IJRZfukqGUJUX1oeZWVsGhEEOsS+Z
X-Gm-Gg: AZFdTZegV+QrIyVERCOKOjX2YCOApS44B8IvenPAqT7MjS88i/Lz/9wYIgNb2tPO9ed
	rz0ueNbz/R0LDxFoyW3ctKx8YpE8tCoTdqRXVFOBq96hHrVdDWdPzCvI/3ap3O4dwtucBfR+kbN
	7vXhqmhZedkS96a1QLB0yWaEZReNL3BeipEEYmYq+hB7gcA1JiSgFjyDpJ9PI4pWIPgm6+L8oqU
	VcDHkZ9optny0W3QEiiM1BkHlwAUSYtnXe0lOy13JK+d9YB/WmtUZMkeS8Mrzx+zKxPMargqM4X
	bzTkdza2SL2xujd30pjCX3iwFbmUaPy5gEV4SBRMsduftchsvjJ3N8pqgPC0Pz3C5SRlgGv/97W
	2KE8Vcyb1o/6njbyvfiPqYrBGlfXsYCfRXv4WUJ09bvnxrStZvYdjZnIlP9l05F0A4MDZdLPaFt
	j/yR/KVyuWiho6+WYJPkDJqdpCIHmJCm68rp4fg5bhKu7Ymf9owFmFLF0CK8V3j1a0HGMjs8MVF
	bA3cAQDALbdRBJJmhiGKGh0sotljpWLDbKuwfDb6UxpBub8Qjd2YprttcsJiuJiwUHMePKpRtjU
	pzlsZgvE30QagDZKEQab+EouCfgaYJdobYOdazdbqw==
X-Received: by 2002:a17:90b:2c84:b0:3a5:c08:4c41 with SMTP id 98e67ed59e1d1-3b41c98a138mr5054210a91.50.1795262608391;
        Sat, 21 Nov 2026 04:03:28 -0800 (PST)
Received: from [127.0.1.1] ([220.196.193.21])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405d97356sm11171339a91.13.2026.11.21.04.03.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 04:03:27 -0800 (PST)
From: Chaosheng Qu <chaosheng.qu.linux@gmail.com>
To: linux-trace-kernel@vger.kernel.org
Cc: Steven Rostedt <rostedt@goodmis.org>, Tomas Glozar <tglozar@redhat.com>, linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/2] rtla: handle SIGTERM and test abnormal exits
Date: Sat, 21 Nov 2026 20:03:22 +0800
Message-ID: <cover.1795262546.git.chaosheng.qu.linux@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

v3 split the test changes into their own patch and fixed the commit
messages, but the test still signalled as soon as the instance directory
appeared plus one second.  On a slow guest that can beat set_signals(),
which is the startup race sashiko described.  v4 waits until
/proc/<pid>/status reports SIGTERM in SigCgt before signalling.

Patch 1 is unchanged: it adds the SIGTERM handler that was missing.
SIGINT, the -d/--duration timer and a failing --on-threshold action
already reach the cleanup path; SIGTERM terminated the process and left
its tracefs instance behind.

Patch 2 is the test, now with the readiness check.  With it, cleanup.t
passes all five cases on a 7.3-rc7 guest, including SIGTERM; without the
handler, SIGTERM leaves the instance behind and the test fails.

v3: https://lore.kernel.org/linux-trace-kernel/cover.1795258353.git.chaosheng.qu.linux@gmail.com/
v2: https://lore.kernel.org/linux-trace-kernel/1794300001.11111.1234567890@gmail.com/
v1: https://lore.kernel.org/linux-trace-kernel/20261017122359.402696-1-chaosheng.qu.linux@gmail.com/

This replaces the v1 submission, the v2 series and v3.

Changes since v3:
- wait for the SIGTERM handler instead of a fixed sleep in the test
- no change to patch 1

Testing: cleanup.t on 7.3-rc7, 4 vCPU QEMU guest -- SIGINT, SIGTERM,
-d timer, action failure and repeated interrupts all pass.  With the
handler removed, the SIGTERM case fails as expected.

Chaosheng Qu (2):
  rtla: handle SIGTERM during a run
  rtla/tests: cover cleanup on abnormal exits

 tools/tracing/rtla/src/common.c               |   2 +
 tools/tracing/rtla/tests/cleanup.t            |  70 ++++++
 .../rtla/tests/scripts/check-cleanup.sh       | 219 ++++++++++++++++++
 3 files changed, 291 insertions(+)
 create mode 100644 tools/tracing/rtla/tests/cleanup.t
 create mode 100755 tools/tracing/rtla/tests/scripts/check-cleanup.sh

-- 
2.43.0


