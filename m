Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795729550;
	b=doeGTyDrZaFqm58OlMsZIekmRKpFiCevuYwj3rHr0cWJn3/HTS//q5R0b5Pdn02UI55e
	 lt8PyBzmXmvXLw2cmqk1zG45nfaRQNbpasa3Ao1P0IlHBRaTtzg/qJSOVRHkqzunEkXf1
	 gcwlunEk1dqXdXC10AiNr4Ed0kJMYVIGIlGa1EG3tSEmJP7Nok5asiB2hxY8r9zF4vkxc
	 NGyjS09q0gBVGZOEFmqko1zvirzr88MXecnjBiZdNC3krNV57zjWdK2MJnFD3kpDJ0l1A
	 MDGI5Ogx7V/Xmx7CIRAo5h9WC/6o0xXcuq9QwEzZBqkP103eOmsBlaKFEP2vAQWMm6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795729550;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=rbnALwWQni6QwZzrT13h6XvdU083PfOU1t4S0GjBaUw=;
	b=B44Vda6u5Tod9iLDP3b2C8DJYSFPpGrahd97M2QdkoKxaCdfGXOtP0pJccqrcvsJ6FfT
	 RFHW/1CegF2s3xOsVh7WtP62Pn+pPAZIgSek6NNimW7ZRF2/ZkkQGBE8mCxQYLWaH3Tqc
	 aZ9ilroy88Iq4dQYJM9Zp5fLCgc15HGrrCvznlUO1Fxja7d9Mx+XYbXZMd3sPPv6ea5eW
	 3NOU4SaJdFJ1LPd7yjIw9B/4ii3AoG8yfMk4REobcGgSAXN0qfxjUY4F+SdD0/iedt953
	 ln2HU6Y3mCnQtnqiRMOzi1O0FGc+qnTbQFWkJr9Do6eBt7/sPYMVDmq0jd2a5nrn8fw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Nvn5o3t4;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC6A9606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 21:45:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BC6A9606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Nvn5o3t4
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a35ac4475dso54172055e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 13:45:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795729548; x=1796334348; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=rbnALwWQni6QwZzrT13h6XvdU083PfOU1t4S0GjBaUw=;
        b=Nvn5o3t4utjFHwq8P8C6aVYApdvQi/eP6pXDMwbDBFNn+Zgs+Spze6FEolyTC2A32Z
         w46FB8WOcZWJVaNrPLBu66odoBKakmSn6VG+/uO+VsppyYJU8O9cyQ8jmcSIp+bm7piE
         URb3Is1TN7AbvHT04OMQVQnQ5gV430WRjcampM7+J7jQdNV7Ufq4+jUDbR4ztiYtABZk
         S2gT+BLg97r0yPg6jKQNXzJyItAtSz3UxeyZ5CxFmA9EHnJAlsr2plu3Q4HqT5HN3HFf
         Cz/FI32hxPt106VQserQpFlOmXee2KupSO1NBxKW17hz4yt0f+BRX68pg91EWjnNhkDd
         l3BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795729548; x=1796334348;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rbnALwWQni6QwZzrT13h6XvdU083PfOU1t4S0GjBaUw=;
        b=ewgnVfsfUv3K3ctWGr/o/chZJkOlfoNa/nqhYDvyobxjMYDCnrsOIGbL/msI7sjBnt
         r3muc3Fxk/GbHyNTx4IlSpT77znvh693B/6+VLI/vxLRTFeqUmAQFJTBtkKjvz0UUF9i
         7ONzHZT7PtHfQ7IMXh6/cSILtwIHkmo578ZYkLUwKKEu58UmvXJJlD5gg3s7/4jgrA8B
         BMbrzqOcZCz8c2geSkt8rg5s5Zvi8YsqQjE+ATyhArXTLaW5DtZlFmyMHWjHZoBLBXZH
         6H45dNDmiRZzGjp4OAkOKATAmODsCDgcoI2SbRmbuLvTdU6AIUC6HuWpFRdrq+z6i+Jl
         O6xA==
X-Forwarded-Encrypted: i=1; AL+hErGyvBvVR0p+pRKpyvdDnWF1/jtf+v7lhhD3btm0OuzdwwojWsz8kQIOtzuY8QTnXLRRC9vbC4pzO9JLJac=@vger.kernel.org
X-Gm-Message-State: APuU4Z+ZQBmHV3X7V+39coLjQJp2Uvio+CG3CUXG3Bn9jENzL6s50JsE
	eAhVmkcXO999Minxo/7wKsmMulVucdY4y40Bv5N/eEngMukqAaQuDiZm
X-Gm-Gg: AZFdTZcYNI1pP1nFZG3+m++2qej6P6E/lyK12qi9qKGJeOXuaxu87F/2nro3AgH4iGj
	tfYVtVfqsdXDXfjvCV+kCIk41Z36/5DVB0hDwtuSdKHGQ5YAqz1JWt/7mS9yUthf1wN7Fa1eYQb
	KOjTojLIhqDtFnQX9+oUkRsu5Ct4ODNxgQaH1UirFT5KW/llLxszxuM2baKH/ERGfMX/U3jngkJ
	27c1v6WZmvbHM6TWdnVgGVygC1Di9sZzKVyxs0G2zioAFKuJHXSDGPVCQ9TRmwZw1kIH06rcwS1
	N3Xv89C6bJ037A5thvJCQBgM72BcxShx37DzOWgGXsPzZiAT9er4vFwCaD8zCiP4jzecr5tFCA4
	FdMQEjYxTsbU/u2DjtwskNyR94VsK6Y1V6I3oY9nOS1Eb1FLwvu5ME97dDA7o2sjnOOUpS0oZZv
	K+EwOqQnTvx0Z0ADQ9zdeifDptonuF0aZb5JGd5kgRQIxdmjoTowPysOveYEiA32oiPnNq4Rg+H
	1DsXQGjPjHrJkTh3dMjyPYRt2U/5QYuqrswXLKyVo6Si5qU+G4JMlmtxm8H9odCLxdx2rmXsxdo
	I2nnqXX1xUT65/DSYTOxkWqu2+E/2nI8urSDUUmlU7+qGS9ceXy9OuOKF72zeWWRwx79BJzdBQj
	LwgA2Ajaqc+D5aA==
X-Received: by 2002:a05:600c:1d86:b0:4a1:fa27:df7c with SMTP id 5b1f17b1804b1-4bb88922972mr472705935e9.34.1795729547788;
        Thu, 26 Nov 2026 13:45:47 -0800 (PST)
Received: from dohko.chello.ie (188-141-5-72.dynamic.upc.ie. [188.141.5.72])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884a3a3dsm623698185e9.10.2026.11.26.13.45.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 13:45:47 -0800 (PST)
From: David Carlier <devnexen@gmail.com>
To: Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>
Cc: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	linux-trace-kernel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	David Carlier <devnexen@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] tracing: Fix trace_event_file leak on read-only instances
Date: Thu, 26 Nov 2026 21:45:44 +0000
Message-ID: <20261126214544.1202386-1-devnexen@gmail.com>
X-Mailer: git-send-email 2.55.0
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

event_create_dir() takes a reference on the trace_event_file that is
dropped by the release callback of the "enable" eventfs entry. A
read-only (backup) instance only registers the first
NR_RO_EVENT_ENTRIES entries, so release_ei() never reaches that
callback and every trace_event_file of the instance is leaked when it
is removed.

Move the release callback to the "format" entry, which all instances
have.

Fixes: 2c79da099aac ("tracing: Make the backup instance non-reusable")
Cc: stable@vger.kernel.org # 7.1+
Signed-off-by: David Carlier <devnexen@gmail.com>
---
 kernel/trace/trace_events.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/kernel/trace/trace_events.c b/kernel/trace/trace_events.c
index 7f89160aeff3..b3f63b1f86e0 100644
--- a/kernel/trace/trace_events.c
+++ b/kernel/trace/trace_events.c
@@ -3276,7 +3276,7 @@ static int event_callback(const char *name, umode_t *mode, void **data,
 	return 0;
 }
 
-/* The file is incremented on creation and freeing the enable file decrements it */
+/* The file is incremented on creation and freeing the event directory decrements it */
 static void event_release(const char *name, void *data)
 {
 	struct trace_event_file *file = data;
@@ -3298,6 +3298,7 @@ event_create_dir(struct eventfs_inode *parent, struct trace_event_file *file)
 		{
 			.name		= "format",
 			.callback	= event_callback,
+			.release	= event_release,
 		},
 #ifdef CONFIG_PERF_EVENTS
 		{
@@ -3317,7 +3318,6 @@ event_create_dir(struct eventfs_inode *parent, struct trace_event_file *file)
 		{
 			.name		= "enable",
 			.callback	= event_callback,
-			.release	= event_release,
 		},
 		{
 			.name		= "filter",
@@ -3380,7 +3380,7 @@ event_create_dir(struct eventfs_inode *parent, struct trace_event_file *file)
 
 	file->ei = ei;
 
-	/* Gets decremented on freeing of the "enable" file */
+	/* Gets decremented by event_release() when the ei is freed */
 	event_file_get(file);
 
 	return 0;
-- 
2.55.0

