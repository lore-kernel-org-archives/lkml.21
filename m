Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795534181;
	b=Gn1i6L9DRNWdyU67L7hSVIo5M63wKHPr5iyrKZiRZ4xoy0QPUK3enMlo/N10Z9o+AErV
	 8otNRPnxjITFXEgbpCXvQVgbqIvsau+DpG41yCbF4AHkYnTRAOcK4KQPr3nH7e9VKOpLv
	 mDBywC3fjjp/U6Gg2eIR8w3/ylLMC/WbDmDJ3Uad073fVZKq8ueNtyCSG+jHQzI4VhlEC
	 JmZOH8Mar7u+hWHABO8uQo2I7sfdU/Ibxr+iq+LO4qf6yruHioXUjsdBj66wb5IuHA0iG
	 R7QzPuU0DRhkleLzFPwG8bwNlqN+8tAu63BfxxpAzIbUc41Sl5av87E+R+YGW95RvZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795534181;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=TSEZMfxOLFCjZ2pTZlRgmUJ/uywE/FfuQfRBfLgNG8o=;
	b=OoJ3JMy6l6FYSwWwCa3/dirn3HR1tXCIIIpkIVnO3UJlSo4zmh0CTSo/h1J9UBh6vqyd
	 AbXdv/XKQWMWLth2CYpGyQih9E9IImgxANtqPm4X31MZs8C6jhHPjdgr7s4f6ePMps0Uk
	 V0XE2aUL28O0ngO18V7qplQqIk0O/r4GB5CMNfc1nCN77G/+tOZrAtgtEskeeUMv6QJGg
	 QuMY/FHWmzT+7m5G0ie4WXKXrkFrYBwBJ93SU6H3LkogfH3TckrAbr5mpXmWbNw6Eb0wH
	 Q/oEYCfsVNzKN7vKEJ8DVaerclz7Y4bfmbUTFuvwe9104FNnhn+wmB5BxVuq5k01IdQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=HvhJ4axR;
	arc=none smtp.remote-ip=209.85.221.70
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com [209.85.221.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0940606A329
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 15:29:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A0940606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=HvhJ4axR
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-49d70f45b22so2708161f8f.2
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 07:29:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795534179; x=1796138979; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TSEZMfxOLFCjZ2pTZlRgmUJ/uywE/FfuQfRBfLgNG8o=;
        b=HvhJ4axRqUDPYwxmsR8FhIWQMz9ei8GkNnkFc+KfGZ6qldg9DvdNN8LFx9yrjMjZB3
         msI1ZxHIraNHUyH/tvzDhopRiE9vlc2DgIuXUJNcYMuCezUolx7+P7LhPfYT9USeh06e
         eD9yBoZyFCWxs8WwJ15+5HYwPRayzaeImo5+1+g11O6eJN2L9QdVCGXVDoxzJyRRsCyX
         8ojMJO3USNVtfo8Ctkt40uPU1jDhsP+W3FeXxRWf6aI8mQpZ+Butd65ATVUVjp1UNL72
         aJSPPF0gclAZcf1apPP9rZ2zF9Vr5IcWNuYxxcB1EHwvLTGF4wJXpVKWDE/nWtxTybiJ
         jrDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795534179; x=1796138979;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TSEZMfxOLFCjZ2pTZlRgmUJ/uywE/FfuQfRBfLgNG8o=;
        b=tjf5fueAhtq/v2HiDvgS/99gcDjc7OObGl9zimzPnfLxx4ARQMhBx8SduZqG1pL5G2
         29/38vsi9m25xYaOBLMhGEoiFMwSP0lsC6WALhMZ5+ElYloGwMCvcoZCRWBwJeUEHejX
         LJP5SxuZN0ZKJ0C88Ca6k1TcWsslNCmSJGQ6qkoF4552qeYhoc1O0DafNT9vSI9JlBRG
         EYuRmR2XCVBnF8TgdIvctn5M4LZlmxBhatFAlWshUEWtY+mITInmWPGq+QJImkRP1YlF
         t83YWOt9m6YigsaYRC1MZX9aOu8Hoju5cdCoLBHJKhVjoeJtdmHdx5iFkYrOyTILSwUU
         2JTg==
X-Forwarded-Encrypted: i=1; AL+hErEF/mxC/v8bCQAXIArPwvQDwKEEGkqqxSHSayHZiwIHq6poxPhmLTU0vN7DehUfsK6p/jrVylEz5iYAJvA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9OqR+6uc+Chz0XgtFehmEWsuhTrWWqInwJNgaI/xm6Wu4MJa4+
	HDiAhl4ufkN6QdiMaRJmPLtVrz2nSajkWIwrcpjYbkiDrIgAmH+gyh49zWmG2thGqUiRkGbzGqj
	tpZgQYsA5IResVGsd8iqe4g==
X-Received: from wrxk7.prod.google.com ([2002:a05:6000:47:b0:4b8:22cf:5b06])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a5d:5d03:0:b0:492:cd78:7137 with SMTP id ffacd0b85a97d-4abaa9764d3mr29902854f8f.8.1795534178633;
 Tue, 24 Nov 2026 07:29:38 -0800 (PST)
Date: Tue, 24 Nov 2026 15:28:44 +0000
In-Reply-To: <20261124152845.2233401-1-vdonnefort@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261124152845.2233401-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.56.1.809.ga0b61035b5-goog
Message-ID: <20261124152845.2233401-21-vdonnefort@google.com>
Subject: [PATCH v9 20/21] Documentation: tracing/remotes: Add detailed tracefs layout
From: Vincent Donnefort <vdonnefort@google.com>
To: rostedt@goodmis.org, mhiramat@kernel.org, 
	linux-trace-kernel@vger.kernel.org
Cc: mathieu.desnoyers@efficios.com, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"

Add a description for each tracefs file available in a trace remote
instance.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
---
 Documentation/trace/remotes.rst | 66 +++++++++++++++++++++++++++++++--
 1 file changed, 62 insertions(+), 4 deletions(-)

diff --git a/Documentation/trace/remotes.rst b/Documentation/trace/remotes.rst
index 1f9d764f69aa..b02ebed4a03f 100644
--- a/Documentation/trace/remotes.rst
+++ b/Documentation/trace/remotes.rst
@@ -19,8 +19,8 @@ for which the host kernel can see and expose to user space.
 
 Register a remote
 =================
-A remote must provide a set of callbacks `struct trace_remote_callbacks` whom
-description can be found below. Those callbacks allows Tracefs to enable and
+A remote must provide a set of callbacks `struct trace_remote_callbacks` whose
+description can be found below. Those callbacks allow Tracefs to enable and
 disable tracing and events, to load and unload a tracing buffer (a set of
 ring-buffers) and to swap a reader page with the head page, which enables
 consuming reading.
@@ -28,8 +28,66 @@ consuming reading.
 .. kernel-doc:: include/linux/trace_remote.h
 
 Once registered, an instance will appear for this remote in the Tracefs
-directory **remotes/**. Buffers can then be read using the usual Tracefs files
-**trace_pipe** and **trace**.
+directory **remotes/**. The files within this directory allow configuring
+and reading the remote buffer (see `The File System` below).
+
+The File System
+===============
+A remote tracing instance is represented by a directory in Tracefs under
+**remotes/**. The layout and files within it are very similar to standard ftrace
+instances. Inside the remote directory, the following files and directories are
+available:
+
+  tracing_on
+	This file allows enabling or disabling the remote tracing.
+
+  buffer_size_kb
+	This file displays and allows changing the size of the per-CPU ring
+	buffers used by the remote. It also shows if the buffer is **loaded** or
+	**unloaded**. To change the size, the remote buffers must be unloaded
+	first. Remote buffers are automatically unloaded when **tracing_on** is
+	off, no one is reading the buffer (either by accessing **trace_pipe** or
+	when **dmesg** is on) and no events remain in the buffer.
+
+  trace
+	Display the human-readable content of the remote buffers. Reading this
+	file is non-consuming. Writing to this file clears the ring buffers.
+
+  trace_pipe
+	Similar to **trace** but reading it consumes the events from the ring
+	buffers (consuming read). It blocks if there are no new events.
+
+  dmesg
+	When enabled, all events from the remote are redirected to the kernel
+	dmesg. This is similar to the **tp_printk** option for in-kernel events.
+	It counts as a reader of the remote buffers and prevents unloading.
+
+  dump_on_panic
+	When enabled, the remote tracing buffer is dumped to the console when a
+	kernel panic occurs.
+
+  poll_ms
+	Modifies the polling interval for the trace_remote.
+
+  per_cpu/
+	This directory contains subdirectories for each possible CPU (e.g.,
+	**cpu0/**, **cpu1/** ...)
+
+  per_cpu/cpuX/trace
+	This is similar to the **trace** file, but it will only display the data
+	specific for the CPU. If written to, it only clears the specific CPU
+	buffer.
+
+  per_cpu/cpuX/trace_pipe
+	This is similar to the **trace_pipe** file, and is a consuming read, but
+	it will only display (and consume) the data specific to the CPU.
+
+  events/
+	This directory contains remote events that can be enabled or disabled.
+
+  events/enable
+	Allows enabling or disabling all the remote events.
+
 
 Declare a remote event
 ======================
-- 
2.56.1.809.ga0b61035b5-goog

